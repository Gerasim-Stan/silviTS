# encoding : utf-8
require 'rails_helper.rb'

describe Destination do
  let(:destination) { FactoryGirl.build :destination }

  it "has valid factory" do
    expect(destination).to be_truthy
  end

  it "has name" do
    destination.name = nil
    expect(destination.save).to be_falsey
  end

  it "name has UTF-8 cahracters" do
    city = "Велинград"
    destination.name = city
    expect(destination.name).to match(city)
  end

  it "name's length >= 3" do
    expect(FactoryGirl.build(:destination, name: '').save).to be_falsey
    expect(FactoryGirl.build(:destination, name: '1').save).to be_falsey
    expect(FactoryGirl.build(:destination, name: '42').save).to be_falsey
  end

  it "name's length <= 20" do
    destination.name = 'String with length 21.'
    expect(destination.save).to be_falsey 
  end

  it "can't share one name for two destinations" do
    expect(FactoryGirl.build(:destination, name: 'unique').save).to be_truthy
    expect(FactoryGirl.build(:destination, name: 'unique').save).to be_falsey
  end
end

