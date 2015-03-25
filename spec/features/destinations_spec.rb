# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../rails_helper'

describe "core functionalities for destinations", type: :feature, js: true do
  context "valid attributes" do
    it "creates new destination" do
      create_new_destination('Мухово')
      expect(page).to have_content 'Мухово'
      remove_the_first_found_destroy_button
    end

    it "edits existing destination" do
      create_new_destination
      first(:button, 'Edit').click
      fill_in 'destination_name', with: 'Байлово'
      click_button 'Update Destination'
      expect(page).to have_content 'Байлово'
      remove_the_first_found_destroy_button
    end

    it "removes destination" do
      create_new_destination('Абланица')
      first(:button, 'Destroy').click
      page.driver.browser.switch_to.alert.accept
      expect(page).to_not have_content 'Абланица'
    end
  end

  context "invalid attributes" do
    it "fails to create destination with invalid name" do
      create_new_destination('dd')
      expect(page).to have_content '1 error prohibited this destination from being saved'
    end

    it "fails to edit destination with invalid name" do
      create_new_destination
      first(:button, 'Edit').click
      fill_in 'destination_name', with: 'dd'
      click_button 'Update Destination'
      expect(page).to have_content '1 error prohibited this destination from being saved'
      remove_the_first_found_destroy_button
    end

    it "fails to remove destination when not confirming" do
      create_new_destination('Абланица')
      first(:button, 'Destroy').click
      page.driver.browser.switch_to.alert.dismiss
      expect(page).to have_content 'Абланица'
    end
  end
end
