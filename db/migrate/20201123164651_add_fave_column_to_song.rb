class AddFaveColumnToSong < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :is_fav, :boolean, default: false
  end
end
