class AddAmountMonesToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :mone_amount, :integer
  end
end
