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

  context "invalid transportation" do
  	let(:invalid_transportation) { FactoryGirl.build(:invalid_transportation) }

  	it "has invalid factory" do
  	  expect(invalid_transportation.valid?).to be_falsey
  	end

  	it "doesn't accept description value 9" do
  	  transportation.description = "Exactly 9"
  	  expect(invalid_transportation.valid?).to be_falsey
	end

	it "doesn't accept priority value < 1" do
	  transportation.priority = rand(- 9999999..0)
	  expect(transportation.valid?).to be_falsey
	end
  end
end
