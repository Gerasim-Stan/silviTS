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

  factory :reservation do
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { Faker::Internet.email }
    telephone { Faker::Base.numerify('0### ## ## ##') }
    attendance [true, false].sample
    city_of_departure  { Faker::Address.city }
    additional_message { Faker::Lorem.paragraph }
    association :transportation
    association :trip
  end

  factory :invalid_reservation do
    name ""
    surname ""
    email ""
    telephone ""
    attendance nil
    city_of_departure ""
    additional_message nil
  end

  factory :transportation do
    description { Faker::Lorem.sentence }
    presence    { Faker::Number.number(2).to_i }
  end

  factory :invalid_transportation, parent: :transportation do
    description nil
    presence    nil
  end
end


















