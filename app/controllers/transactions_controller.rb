class TransactionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
		@transactions = @user.transactions
	end

	def new
		@transaction = Transaction.new(transaction_params)
		@transaction.sender_id = current_user.id
		@email = params[:email]
		@transaction.user = User.all.where(@email)
		if @transaction.save
			redirect_to @transaction
		else
			puts @transaction.errors.full_messages
			render 'new'
		end
	end

	def create
	end

	def show
	end

	private
  		def transaction_params
    		params.require(:transaction).permit(:user_id,:sender_id,:amount)
  		end
end
