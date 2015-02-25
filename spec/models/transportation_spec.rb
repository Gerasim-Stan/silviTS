require 'rails_helper'

describe Transportation do
  let(:transportation) { FactoryGirl.create(:transportation) }

  context "valid transportation" do
  	it "has valid factory" do
  	  expect(transportation.valid?).to be_truthy
  	end

  	it "has description" do
  	  transportation.description = nil
  	  expect(transportation.valid?).to be_falsey
	end

	it "description's length >= 10" do
	  transportation.description = 'Ten chars.'
	  expect(transportation.valid?).to be_truthy
	end

	it "has priority" do
	  transportation.priority = nil
	  expect(transportation.valid?).to be_falsey
	end

	it "accepts only integer for priority" do
	  expect(transportation.priority).to be_instance_of Fixnum
	end

	it "priority's value is natural number" do
	  expect(transportation.priority.to_i).to be > 0
	end
  end
end
