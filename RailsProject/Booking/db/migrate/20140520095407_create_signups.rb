class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone

      t.timestamps
    end
		add_index :signups, [:email], :unique => true
  end
end
