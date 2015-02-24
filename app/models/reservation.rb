class Reservation < ActiveRecord::Base
  belongs_to :transportation
  belongs_to :trip
  attr_accessible :additional_message, :attendance, :city_of_departure, :email, :name, :surname, :telephone
end
