class AddShortDescriptionToTransportation < ActiveRecord::Migration
  def up
    add_column :transportations, :short_description, :string, default: ''
    execute "ALTER TABLE transportations ALTER COLUMN short_description SET NOT NULL;"
  end

  def down
    remove_column :transportations, :short_description, :string
  end
end
