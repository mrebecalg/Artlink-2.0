class RemoveUserIdToPostulations < ActiveRecord::Migration[8.0]
  def change
    remove_column :postulations, :user_id, :integer
  end
end
