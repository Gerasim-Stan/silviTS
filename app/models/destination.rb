class Destination < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence   => true,
                   :uniqueness => true,
                   :length     => { :minimum => 3, :maximum => 20 }

  has_many :trips
end
