class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :telephone
      t.boolean :attendance
      t.string :city_of_departure
      t.text :additional_message
      t.references :transportation
      t.references :trip

      t.timestamps
    end
    add_index :reservations, :transportation_id
    add_index :reservations, :trip_id
  end
end
