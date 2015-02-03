class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.primary_key :id
      t.string :name

      t.timestamps
    end
  end
end
