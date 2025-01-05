class AddAverageRatingToPublications < ActiveRecord::Migration[8.0]
  def change
    add_column :publications, :average_rating, :float, default: 0.0
  end
end
