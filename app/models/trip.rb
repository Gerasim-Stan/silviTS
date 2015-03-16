class Trip < ActiveRecord::Base
  belongs_to :destination
  belongs_to :event
  attr_accessible :date, :hour, :starting_point, :destination_id, :event_id

  validates :date, :presence => true
  validates :hour, :presence => true
  validates :starting_point, :presence => true,
                             :length   => { :minimum => 3 }
  validates :destination_id, :presence => true
  validates :event_id, :presence => true

  def due_date
    DateTime.new(date.year, date.month, date.day, 21, 0, 0).yesterday
  end
end
