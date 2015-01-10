class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :users, :city, :city_id
  	rename_column :users, :state, :state_id
  end
end
