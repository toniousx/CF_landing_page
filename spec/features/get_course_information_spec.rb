require 'rails_helper'

feature 'get course information' do
  scenario 'become ui designer', :vcr do
    visit '/'
    expect(page).to have_content('Become a UI Designer')
    click_on('Become a UI Designer')
    expect(page).to have_content('Tuesday, May 29th, 2018')
    expect(page).to have_content('$4999')
  end
end
