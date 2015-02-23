require 'faker'

FactoryGirl.define do
  factory :destination do
    name { Faker::Address.city }
  end

  factory :invalid_destination, parent: :destination do
    id nil
    name nil
  end

  factory :event do
    name { Faker::Internet.password(12) }
    description { Faker::Internet.password(20) }
  end

  factory :invalid_event, parent: :event do
    id   nil
    name nil
    description nil
  end

  factory :trip do
    date { Faker::Date.between(1000.days.ago, 1000.days.from_now) }
    hour { Faker::Time.between(1000.days.ago, 1000.days.from_now) }
    starting_point { Faker::Address.street_name }
    association :destination
    association :event
  end

  factory :invalid_trip, parent: :trip do
    id nil
    date nil
    hour nil
    starting_point nil
    destination_id nil
    event_id nil
  end
end

