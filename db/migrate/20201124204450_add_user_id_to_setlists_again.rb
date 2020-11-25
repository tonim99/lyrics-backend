class AddUserIdToSetlistsAgain < ActiveRecord::Migration[6.0]
  def change
    add_reference :setlists, :user, foreign_key: true
  end
end
