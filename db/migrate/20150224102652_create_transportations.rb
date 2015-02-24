class CreateTransportations < ActiveRecord::Migration
  def change
    create_table :transportations do |t|
      t.string :description
      t.integer :priority

      t.timestamps
    end
  end
end
