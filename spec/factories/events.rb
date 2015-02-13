require 'faker'

FactoryGirl.define do
  factory :event do
    name { Faker::Internet.password(12) }
    description { Faker::Internet.password(20) }
  end

  factory :invalid_event, parent: :event do
    id   nil
    name nil
    description nil
  end
end

