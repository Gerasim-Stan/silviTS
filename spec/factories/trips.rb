require 'faker'

FactoryGirl.define do
  factory :trip do
    date { Faker::Date.between(1000.days.ago, 1000.days.from_now) }
    hour { Faker::Time.between(1000.days.ago, 1000.days.from_now) }
    starting_point { Faker::Address.street_name }
    destination_id (- 1)
    event_id (- 1)
  end

  factory :invalid_arguments, parent: :trip do
    id nil
    date nil
    hour nil
    starting_point nil
    destination_id nil
    event_id nil
  end
end

