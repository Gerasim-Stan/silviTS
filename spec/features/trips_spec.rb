# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../rails_helper'

describe "core functionalities for trips", type: :feature, js: true do
  let!(:first_destination)  { FactoryGirl.create(:destination) }
  let!(:first_event)         { FactoryGirl.create(:event) }
  let!(:second_destination) { FactoryGirl.create(:destination) }
  let!(:second_event)        { FactoryGirl.create(:event) }

  context "valid attributes" do
    it "creates new trip" do
      create_new_trip
      remove_the_first_found_destroy_button '/trips'
    end

    it "edits existing trip" do
      create_new_trip
      first(:button, 'Edit').click
      fill_in "trip_hour",           with: "16:19"
      fill_in "trip_starting_point", with: "НДК"
      select_dropdown_option('trip_destination_id', Destination.all.sample.name)
      select_dropdown_option('trip_event_id', Event.all.sample.name)
      click_button 'Update Trip'
      expect(page).to have_content 'НДК'
      remove_the_first_found_destroy_button '/trips'
    end

    it "removes trip" do
      create_new_trip(trip_starting_point: "Примерна начална точка")
      first(:button, 'Destroy').click
      page.driver.browser.switch_to.alert.accept
      expect(page).to_not have_content "Примерна начална точка"
      expect(Trip.count).to be == 0
    end
  end

  context "invalid attributes" do
    it "fails to create trip with invalid hour" do
      create_new_trip(trip_hour: '500:69')
      expect(page).to have_content "Hour can't be blank"
    end

    it "fails to create trip with invalid starting point" do
      create_new_trip(trip_starting_point: 'dd')
      expect(page).to have_content "Starting point is too short (minimum is 3 characters)"
    end

    it "fails to edit trip without hour" do
      create_new_trip
      first(:button, 'Edit').click
      fill_in "trip_hour", with: nil
      click_button 'Update Trip'
      expect(page).to have_content "Hour can't be blank"
      remove_the_first_found_destroy_button '/trips'
    end

    it "fails to edit trip without starting point" do
      create_new_trip
      first(:button, 'Edit').click
      fill_in "trip_starting_point", with: nil
      click_button 'Update Trip'
      expect(page).to have_content "Starting point can't be blank"
      remove_the_first_found_destroy_button '/trips'
    end

    it "fails to remove trip when dismissing" do
      create_new_trip(trip_starting_point: 'Уникална начална точка')
      first(:button, 'Destroy').click
      page.driver.browser.switch_to.alert.dismiss
      expect(page).to have_content 'Уникална начална точка'
    end
  end
end