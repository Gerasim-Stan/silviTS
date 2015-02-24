require 'spec_helper'

describe Reservation do
  let(:reservation) { FactoryGirl.create :reservation }

  context "valid reservation" do
  	it "has valid factory" do
  	  expect(reservation.valid?).to be_truthy
  	end

  	it "has name" do
  	  reservation.name = nil
  	  expect(reservation.valid?).to be_falsey
  	end

  	it "name's lenght >= 2" do
      expect(reservation.name.length).to be >= 2
  	end

  	it "has surname" do
  	  reservation.surname = nil
  	  expect(reservation.valid?).to be_falsey
  	end

  	it "surname's length >= 3" do
  	  expect(reservation.surname.length).to be >= 3
  	end

  	it "has telephone" do
  	  reservation.telephone = nil
  	  expect(reservation.valid?).to be_falsey
  	end

  	it "telephone is in valid format" do
  	  expect(reservation.telephone.delete('+/() ').to_i).to be > 0
  	end

  	it "has email" do
      reservation.email = nil
  	  expect(reservation.valid?).to be_falsey
  	end

  	it "has valid email" do
  	  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  	  expect(reservation.email =~ VALID_EMAIL_REGEX).to be_truthy
  	end

  	it "has city of departure" do
  	  reservation.city_of_departure = nil
  	  expect(reservation.valid?).to be_falsey
  	end

  	it "city of departure's length >= 3" do
  	  expect(reservation.city_of_departure.length).to be >= 3
  	end

  	it "has attendance" do
  	  reservation.attendance = nil
  	  expect(reservation.valid?).to be_falsey
  	end

  	it "attendance is true or false" do
  	  expect([true, false]).to include(reservation.attendance)
  	end

  	it "has additional message" do
  	  reservation.additional_message = nil
  	  expect(reservation.valid?).to be_falsey
  	end

  	it "has transportation_id" do
  	  expect(reservation.transportation_id.nil?).to be_falsey
  	end

  	it "has trip_id" do
  	  expect(reservation.trip_id.nil?).to be_falsey
  	end
  end
end
