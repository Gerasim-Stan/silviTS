class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.primary_key :id
      t.date :date
      t.time :hour
      t.references :destination
      t.string :starting_point
      t.references :event

      t.timestamps
    end
  end
end
