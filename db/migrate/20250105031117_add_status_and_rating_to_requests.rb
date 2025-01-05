class AddStatusAndRatingToRequests < ActiveRecord::Migration[8.0]
  def change
    add_column :requests, :rating, :integer
  end
end
