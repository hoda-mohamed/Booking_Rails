class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.integer :room_id
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
