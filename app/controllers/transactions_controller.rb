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
			if User.find(@transaction.sender_id).role == 'estudiante'
				puts 'estoy adentro'
				if current_user.mone.quantity < @transaction.amount
					redirect_to transactions_path
					return
					#falta colocar alerta de que no tiene saldo
				else
					if @transaction.save
						sender = current_user
						saldo = sender.mone.quantity - (@transaction.amount / 1000)
						receiver = @transaction.user
						sender.mone.update(quantity:saldo)
						receiver.mone.update(quantity:(receiver.mone.quantity+@transaction.amount / 1000))
						redirect_to @transaction
						return
					else
						puts @transaction.errors.full_messages
						redirect_to new_transaction_path
					end
				end
			elsif User.find(@transaction.sender_id).role == 'aportante'
				if current_user.mone.quantity < @transaction.amount
					redirect_to transactions_path
					return
					#falta colocar alerta de que no tiene saldo
				else
					if @transaction.save
						receiver = @transaction.user
						receiver.mone.update(quantity:@transaction.amount)
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
	end

	def show
  		@transaction = Transaction.find(params[:id])
	end

	private
  		def transaction_params
    		params.require(:transaction).permit(:email,:amount)
  		end
end
