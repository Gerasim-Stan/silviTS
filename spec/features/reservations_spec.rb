# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../rails_helper'

describe "core functionalities for reservations", type: :feature, js: true do
  let!(:first_trip)            { FactoryGirl.create(:trip) }
  let!(:first_transportation)  { FactoryGirl.create(:transportation) }
  let!(:second_trip)           { FactoryGirl.create(:trip) }
  let!(:second_transportation) { FactoryGirl.create(:transportation) }

  context "valid attributes" do
    it "creates new reservation" do
      create_new_reservation
      remove_the_first_found_destroy_button '/reservations'
    end
  end

  context "valid attributes" do

  end
end