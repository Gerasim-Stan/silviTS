# -*- encoding : utf-8 -*-
module FeaturesHelper
  def create_new_destination(destination_name = 'Мухово')
    visit "/destinations"
    click_button "New Destination"
    fill_in "destination_name", with: destination_name
    click_button "Create Destination"
  end

  def remove_the_first_found_destroy_button(path)
    visit path
    first(:button, 'Destroy').click
    page.driver.browser.switch_to.alert.accept
  end

  def create_new_event(event_name: 'Приятелска програма', event_description: 'Готино описание на приятелска програма.')
    visit "/events"
    click_button "New Event"
    fill_in "event_name", with: event_name
    fill_in "event_description", with: event_description
    click_button "Create Event"
  end

  def select_dropdown_option(id, value)
    select "#{value}", :from => "#{id}"
  end

  def create_new_trip(trip_hour: '8:45', trip_starting_point: "БНБ")
    visit "/trips"
    click_button "New Trip"
    fill_in "trip_hour"          , with: trip_hour
    fill_in "trip_starting_point", with: trip_starting_point
    select_dropdown_option('trip_destination_id', Destination.all.sample.name)
    select_dropdown_option('trip_event_id', Event.all.sample.name)
    click_button "Create Trip"
  end

  def create_new_reservation(name: nil, surname: nil, telephone: nil, email: nil, city_of_departure: nil, attendance: nil)
    visit "/reservations"
    click_button "New Reservation"
    fill_in "reservation_name", with: name || Faker::Name.first_name
    fill_in "reservation_surname", with: surname || Faker::Name.last_name
    fill_in "reservation_email", with: email || Faker::Internet.email
    fill_in "reservation_telephone", with: telephone || Faker::PhoneNumber.cell_phone
    fill_in "reservation_city_of_departure", with: city_of_departure || Faker::Address.city
    # fill_in "reservation_attendance", with: attendance || [true, false].sample
    select_dropdown_option("reservation_transportation_id", Transportation.all.sample.description)
    select_dropdown_option("reservation_trip_id", [Trip.all.sample].map { |t| [Destination.find(t.destination_id).name + ' ' + t.date.strftime('%d-%m-%Y'), t.id] }[0][0])
    click_button "Create Reservation"
  end
end
