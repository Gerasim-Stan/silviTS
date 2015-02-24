class AddConstraintsToTransport < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE transportations ALTER COLUMN description SET NOT NULL;'
    execute 'ALTER TABLE transportations ALTER COLUMN priority SET NOT NULL;'
  end

  def down
    execute 'ALTER TABLE transportations ALTER COLUMN description DROP NOT NULL;'
    execute 'ALTER TABLE transportations ALTER COLUMN priority DROP NOT NULL;'
  end
end
