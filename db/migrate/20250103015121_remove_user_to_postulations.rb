class RemoveUserToPostulations < ActiveRecord::Migration[8.0]
  def change
    remove_column :postulations, :user, :string
  end
end
