class AddFieldsToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :lat, :float
    add_column :rooms, :long, :float
  end
end
