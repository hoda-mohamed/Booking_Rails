class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :hotel_id
      t.integer :room_number
      t.integer :room_price
      t.integer :room_discount
      t.string :room_service
      t.string :room_image

      t.timestamps
    end
		add_index :rooms, [:hotel_id, :room_number], :unique => true
		execute "ALTER TABLE rooms ADD FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE cascade ON UPDATE cascade"
  end
end
