require 'rails_helper'

feature 'get course information' do
  scenario 'become ui designer' do
    visit '/'
    expect(page).to have_content('Become a UI Designer')
    click_on('Become a UI Designer')
    # expect(page).to have_content('Monday, May 14th, 2018')
    # expect(page).to have_content('$4999')
  end
end
