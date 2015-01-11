module TransactionsHelper
  def transactions_chart_data

    (3.weeks.ago.to_date..Date.today).map do |date|
      {
        created_at: date,
        amount: current_user.transactions.where("date(created_at)=?",date).sum(:amount)
      }
     end
  end
end
