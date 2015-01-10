class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user
      t.integer :sender_id
      t.integer :amount

      t.timestamps null: false
    end
  end
end
