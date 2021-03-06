class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.integer :room_id
      t.text :comment

      t.timestamps
    end
		execute "ALTER TABLE comments ADD FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE cascade ON UPDATE cascade"
		execute "ALTER TABLE comments ADD FOREIGN KEY (`user_id`) REFERENCES `signups` (`id`) ON DELETE cascade ON UPDATE cascade"

  end
end
