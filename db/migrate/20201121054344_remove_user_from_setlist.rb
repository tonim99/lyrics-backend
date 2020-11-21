class RemoveUserFromSetlist < ActiveRecord::Migration[6.0]
  def change
    remove_column :setlists, :user_id
  end
end
