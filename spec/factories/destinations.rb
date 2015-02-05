require 'faker'

FactoryGirl.define do
  factory :destination do
    name { Faker::Address.city }
  end

  factory :invalid_destination, parent: :destination do
    id nil
    name nil
  end
end
