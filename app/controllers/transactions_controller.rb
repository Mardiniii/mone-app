class TransactionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
		@transactions = @user.transactions


	end



	def new
		@transaction = Transaction.new
	end

	def create
		@transaction = Transaction.new(transaction_params)
		@transaction.sender_id = current_user.id
		@email = params[:email]
		@transaction.user = User.find_by_email(@email)

		if @transaction.sender_id == @transaction.user.id
			redirect_to new_transaction_path
			return
			#no es posible enviarse dinero a uno mismo
		else
			puts "Current User Role: #{current_user.role} !!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

			if User.find(@transaction.sender_id).role == 'Estudiante'
				if current_user.mone.quantity < @transaction.mone_amount

					# Verificar que el estudiante tenga dinero para transferir
					redirect_to new_transaction_path
					return
					#FALTA COLOCAR ALERTA DE QUE NO TIENE SALDO DISPONIBLE
				else
					if @transaction.save
						sender = current_user
						saldo = sender.mone.quantity - @transaction.mone_amount
						receiver = @transaction.user
						sender.mone.update(quantity:saldo)
						receiver.mone.update(quantity:(receiver.mone.quantity+@transaction.mone_amount))

						redirect_to @transaction
						return
					else
						puts @transaction.errors.full_messages
						redirect_to new_transaction_path
					end
				end
			elsif User.find(@transaction.sender_id).role == 'Aportante'
				@transaction.user = User.find_by_email(@email)
				@transaction.sender_id = current_user.id
				if @transaction.save
					receiver = @transaction.user
					receiver.mone.update(quantity:(receiver.mone.quantity+@transaction.mone_amount))
					redirect_to @transaction
					return
				else
					puts @transaction.errors.full_messages
					redirect_to new_transaction_path
					return
				end
			end
		end
	end

	def show
		require 'elibom'
  		@transaction = Transaction.find(params[:id])
			response = Elibom.send_message(:to => current_user.cellphone, :text => "Felicitaciones! acabas de aportarle #{@transaction.mone_amount} Mone(s) al estudiante #{@transaction.user.name} para ayudarle alcanzar su futuro . fecha: #{@transaction.created_at}  ")
			puts response
			sender=User.find(@transaction.sender_id)
      receiver=@transaction.user
      mone= @transaction.mone_amount
      UserMailer.transactions_sender(sender,mone,receiver).deliver
			UserMailer.transactions_receiver(sender,mone,receiver).deliver

	end

	def create_recharge
		@transaction = Transaction.new
	end

	def save_recharge
		@transaction = Transaction.new(recharge_params)
		@transaction.sender_id = current_user.id
		@transaction.user = current_user
		if @transaction.save
			@transaction.user.mone.update(quantity:(@transaction.user.mone.quantity+@transaction.amount))
			redirect_to @transaction
			return
		else
			puts @transaction.errors.full_messages
			redirect_to new_transaction_path
			return
		end
	end

	private
  		def transaction_params
    		params.require(:transaction).permit(:email,:mone_amount,:amount)
  		end

  		def recharge_params
  			params.require(:transaction).permit(:mone_amount,:amount)
  		end
end
