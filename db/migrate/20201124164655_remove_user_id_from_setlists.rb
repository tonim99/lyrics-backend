class RemoveUserIdFromSetlists < ActiveRecord::Migration[6.0]
  def change
    remove_column :setlists, :user_id, :integer
  end
end
