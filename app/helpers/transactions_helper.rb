module TransactionsHelper
  def transactions_chart_data

  	t = current_user.transactions.order(:created_at).first

    (t.created_at.to_date..Date.today).map do |date|
      {
        created_at: date,
        amount: current_user.transactions.where("date(created_at)=?",date).sum(:amount)
      }
     end
  end
end
