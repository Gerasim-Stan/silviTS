class AddConstraintsToTrips < ActiveRecord::Migration
  def up    
    add_index :trips, :destination_id
    add_index :trips, :event_id

    execute 'ALTER TABLE trips ALTER COLUMN destination_id SET NOT NULL;'
    execute 'ALTER TABLE trips ALTER COLUMN event_id SET NOT NULL;'
    execute 'ALTER TABLE trips ADD CONSTRAINT destidfk FOREIGN KEY (destination_id) REFERENCES destinations (id);'
    execute 'ALTER TABLE trips ADD CONSTRAINT eventidfk FOREIGN KEY (event_id) REFERENCES events(id);'
  end

  def down
    remove_index :trips, :destination_id
    remove_index :trips, :event_id

    execute 'ALTER TABLE trips ALTER COLUMN destination_id DROP NOT NULL;'
    execute 'ALTER TABLE trips ALTER COLUMN event_id DROP NOT NULL;'
    execute 'ALTER TABLE trips DROP CONSTRAINT destidfk;'
    execute 'ALTER TABLE trips DROP CONSTRAINT eventidfk;'
  end
end
