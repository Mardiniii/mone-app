class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :role, :integer
  	add_column :users, :state, :string
  	add_column :users, :city, :string
  	add_column :users, :age, :integer
  	add_column :users, :genre, :string
  end
end
