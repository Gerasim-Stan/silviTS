# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../rails_helper'

describe "core functionalities for events", type: :feature, js: true do
  context "valid attributes" do
    it "creates new event" do
      create_new_event
      remove_the_first_found_destroy_button '/events'
    end

    it "edits existing event" do
      create_new_event
      first(:button, 'Edit').click
      fill_in 'event_name',        with: 'Ново име на приятелска програма'
      fill_in 'event_description', with: 'Ново описание на приятелска програма.'
      click_button 'Update Event'
      expect(page).to have_content 'Ново име на приятелска програма'
      remove_the_first_found_destroy_button '/events'
    end

    it "removes event" do
      create_new_event(event_name: 'Примерно име')
      first(:button, 'Destroy').click
      page.driver.browser.switch_to.alert.accept
      expect(page).to_not have_content 'Примерно име'
    end
  end

  context "invalid attributes" do
    it "fails to create event with invalid name" do
      create_new_event(event_name: 'invalid')
      expect(page).to have_content 'Name is too short (minimum is 12 characters)'
    end

    it "fails to create event with invalid description" do
      create_new_event(event_description: 'invalid')
      expect(page).to have_content 'Description is too short (minimum is 20 characters)'
    end

    it "fails to edit event with invalid name" do
      create_new_event
      first(:button, 'Edit').click
      fill_in 'event_name', with: 'invalid'
      click_button 'Update Event'
      expect(page).to have_content 'Name is too short (minimum is 12 characters)'
      remove_the_first_found_destroy_button '/events'
    end

    it "fails to edit event with invalid description" do
      create_new_event
      first(:button, 'Edit').click
      fill_in 'event_description', with: 'invalid'
      click_button 'Update Event'
      expect(page).to have_content 'Description is too short (minimum is 20 characters)'
      remove_the_first_found_destroy_button '/events'
    end

    it "fails to remove event when dismissing" do
      create_new_event(event_name: 'Примерно име')
      first(:button, 'Destroy').click
      page.driver.browser.switch_to.alert.dismiss
      expect(page).to have_content 'Примерно име'
    end
  end
end
