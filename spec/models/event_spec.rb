require 'spec_helper'

describe Event do
  let(:event) { FactoryGirl.build :event }

  it "has valid factory" do
    expect(event.valid?).to be_truthy
  end

  it "has name" do
    event.name = nil
    expect(event.name).to be_falsey
  end

  it "name's length >= 12" do
    event.name = '11 letters.'
    expect(event.save).to be_falsey
  end

  it "has description" do
    event.description = nil
    expect(event.save).to be_falsey
  end

  it "description's length >= 20" do
    event.description = '19 letters by far..'
    expect(event.save).to be_falsey
  end

  it "can't share one name for two events" do
    event_name = 'unique event name'
    expect(FactoryGirl.build(:event, name: event_name).save).to be_truthy
    expect(FactoryGirl.build(:event, name: event_name).save).to be_falsey
  end
end

