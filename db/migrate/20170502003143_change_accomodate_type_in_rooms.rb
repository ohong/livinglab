class ChangeAccomodateTypeInRooms < ActiveRecord::Migration[5.0]
  def change
    change_column :rooms, :accommodate, :integer
    remove_column :rooms, :integer
  end
end
