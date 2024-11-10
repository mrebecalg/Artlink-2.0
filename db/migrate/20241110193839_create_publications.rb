class CreatePublications < ActiveRecord::Migration[8.0]
  def change
    create_table :publications do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.decimal :price

      t.timestamps
    end
  end
end
