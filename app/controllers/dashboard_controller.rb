class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'application'
  def index
    @transactions_pie= current_user.transactions.group(:sender_id).count
  	@user = current_user
  	@user_transactions = @user.transactions
  	@sended_transactions = Transaction.all.where("sender_id = #{current_user.id}")

  end


end
