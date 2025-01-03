class AddUsernameToPostulations < ActiveRecord::Migration[8.0]
  def change
    add_column :postulations, :username, :string
  end
end
