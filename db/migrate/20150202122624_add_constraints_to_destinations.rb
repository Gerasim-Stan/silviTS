class AddConstraintsToDestinations < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE destinations ALTER COLUMN name SET NOT NULL;'
  end

  def down
    execute 'ALTER TABLE destinations ALTER COLUMN name DROP NOT NULL;'
  end
end
