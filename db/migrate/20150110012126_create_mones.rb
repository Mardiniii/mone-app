class CreateMones < ActiveRecord::Migration
  def change
    create_table :mones do |t|
      t.references :user, index: true
      t.integer :quantity

      t.timestamps null: false
    end
    add_foreign_key :mones, :users
  end
end
