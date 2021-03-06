class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

class Reservation < ActiveRecord::Base
  belongs_to :transportation
  belongs_to :trip
  attr_accessible :additional_message, :attendance, :city_of_departure, :email, :name, :surname, :telephone, :trip_id, :transportation_id

  validates :name, presence: true, length: { minimum: 2 }
  validates :surname, presence: true, length: { minimum: 3 }
  validates :telephone, presence: true, format: { with: /\+?\(?\)?\/?\d+/, on: :create }
  validates :email, presence: true, email: true
  validates :city_of_departure, presence: true, length: { minimum: 3 }
  validates :attendance, inclusion: { in: [true, false] }
  validates :transportation_id, presence: true
  validates :trip_id, presence: true
end
