class AddConstraintsToReservation < ActiveRecord::Migration
  def up
    add_index :reservations, :transportation_id
    add_index :reservations, :trip_id

    execute 'ALTER TABLE reservations ALTER COLUMN additional_message SET NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN attendance SET NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN city_of_departure SET NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN email SET NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN name SET NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN surname SET NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN telephone SET NOT NULL;'
    execute 'ALTER TABLE reservations ADD CONSTRAINT transportationidfk FOREIGN KEY (transportation_id) REFERENCES transportations(id);'
    execute 'ALTER TABLE reservations ADD CONSTRAINT tripidfk FOREIGN KEY (trip_id) REFERENCES trips(id);'
  end

  def down
    remove_index :reservations, :transportation_id
    remove_index :reservations, :trip_id

    execute 'ALTER TABLE reservations ALTER COLUMN additional_message DROP NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN attendance DROP NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN city_of_departure DROP NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN email DROP NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN name DROP NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN surname DROP NOT NULL;'
    execute 'ALTER TABLE reservations ALTER COLUMN telephone DROP NOT NULL;'
    execute 'ALTER TABLE reservations DROP CONSTRAINT transportationidfk;'
    execute 'ALTER TABLE reservations DROP CONSTRAINT tripidfk;'
  end
end
