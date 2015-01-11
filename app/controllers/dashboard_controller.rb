class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'application'
  def index
    @transactions_pie= current_user.transactions.group(:sender_id).count
    @transactions_line= current_user.transactions.group(:created_at,:amount).sum(:amount)
  	@user = current_user
  	@user_transactions = @user.transactions
  	@sended_transactions = Transaction.all.where("sender_id = #{current_user.id}")

  end

  def contributor
  	@sended_transactions = Transaction.all.where("sender_id = #{current_user.id}")
  end
end
