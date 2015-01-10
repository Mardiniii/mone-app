class ChangeGenreToGenreId < ActiveRecord::Migration
  def change
  	rename_column :users, :genre, :genre_id
  end
end
