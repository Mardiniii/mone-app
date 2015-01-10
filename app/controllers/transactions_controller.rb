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

		if @transaction.amount > current_user.mone.quantity
			redirect_to new_transaction_path
			return
		end

		if current_user.role == 1
			saldo = current_user.mone.quantity - @transaction.amount
			current_user.mone.update_attribute(:quantity => saldo) 
			@receiver.mone.quantity += @transaction.amount
			redirect_to 
		end

		# if current_user.mone.quantity == 0 || @transaction.amount > current_user.mone.quantity
		# 	# Transaccion denegada falta de fondos
		# 	render 'index'
		# end
		# if current_user.id = @transaction.sender_id
		# 	current_user.try(:mone).quantity = current_user.mone.quantity - @transaction.amount
		# else
		# 	current_user.quantity = current_user.quantity + @transaction.amount
		# end
		
		# if @transaction.save
		# 	redirect_to transactions_path
		# 	return
		# else
		# 	puts @transaction.errors.full_messages
		# 	redirect_to new_transaction_path
		# 	return
		# end
	end

	def show
	end

	private
  		def transaction_params
    		params.require(:transaction).permit(:email,:amount)
  		end
end
