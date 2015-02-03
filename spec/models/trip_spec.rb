require 'spec_helper'

describe Trip do
  let(:trip) { FactoryGirl.build :trip }

  it "has valid factory" do
    expect(trip.valid?).to be_truthy
  end

  it "has date" do
    trip.date = nil
    expect(trip.valid?).to be_falsey
  end

  it "accepts date" do
    expect(trip.date).to be_instance_of(Date)
  end

  it "has hour" do
    trip.hour = nil
    expect(trip.hour).to be_falsey
  end

  it "accepts hour" do
    expect(trip.hour).to be_instance_of(Time)
  end

  it "has starting point" do
    trip.starting_point = nil
    expect(trip.valid?).to be_falsey
  end

  it "starting_point's length >= 3" do
    expect(FactoryGirl.build(:trip, starting_point: '').valid?).to be_falsey
    expect(FactoryGirl.build(:trip, starting_point: '1').valid?).to be_falsey
    expect(FactoryGirl.build(:trip, starting_point: '42').valid?).to be_falsey
  end

  it "has destination id" do
    trip.destination_id = nil
    expect(trip.valid?).to be_falsey
  end

  it "has event id" do
    trip.event_id = nil
    expect(trip.valid?).to be_falsey
  end
end

