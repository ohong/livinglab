class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :accommodate
      t.integer :bedroom
      t.integer :bathroom
      t.string :listing_name
      t.text :summary
      t.string :address
      t.boolean :has_wifi
      t.boolean :is_furnished
      t.boolean :has_ac
      t.boolean :has_washer_dryer
      t.integer :rent
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
