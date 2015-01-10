class AddColumnMoNeIdToUser < ActiveRecord::Migration
  def change
  	add_column :users, :mone_id, :integer
  end
end
