class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index
    @transactions_pie= current_user.transactions.group(:sender_id).count

  	@transactions = current_user.transactions

  end


end
