class Transportation < ActiveRecord::Base
  has_many :trips
  attr_accessible :description, :priority

  validates :description, presence: true, length: { minimum: 10 }
  validates :priority,    presence: true
end
