require 'faker'

FactoryGirl.define do
  factory :destination do
    name { Faker::Address.city }
  end
end
