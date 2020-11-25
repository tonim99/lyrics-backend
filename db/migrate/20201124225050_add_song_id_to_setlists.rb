class AddSongIdToSetlists < ActiveRecord::Migration[6.0]
  def change
    add_reference :setlists, :song, foreign_key: true
  end
end
