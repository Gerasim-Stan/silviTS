# -*- encoding : utf-8 -*-
module FeaturesHelper
  def create_new_destination(destination_name = 'Мухово')
    visit "/destinations"
    click_button "New Destination"
    fill_in "destination_name", with: destination_name
    click_button "Create Destination"
  end

  def remove_the_first_found_destroy_button
    visit '/destinations'
    first(:button, 'Destroy').click
    page.driver.browser.switch_to.alert.accept
  end
end