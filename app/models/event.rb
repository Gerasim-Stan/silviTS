class Event < ActiveRecord::Base
  attr_accessible :description, :name

  has_many  :trips, :dependent => :destroy

  validates :name, :presence   => true,
                   :uniqueness => true,
                   :length     => { :minimum => 12 }
  validates :description, :presence => true,
                          :length   => { :minimum => 20 }

  validates_associated :trips
end
