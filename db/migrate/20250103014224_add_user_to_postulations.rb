class AddUserToPostulations < ActiveRecord::Migration[8.0]
  def change
    add_column :postulations, :user, :string
  end
end
