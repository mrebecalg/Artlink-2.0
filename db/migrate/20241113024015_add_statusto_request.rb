class AddStatustoRequest < ActiveRecord::Migration[8.0]
  def change
    add_column :requests, :status, :string, default: "Pendiente"
  end
end
