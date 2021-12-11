require 'rails_helper'

RSpec.feature 'Create Organisation', type: :feature do

  before :each do
    @user = create(:user)
    log_in_user
    visit organisations_url

    click_button 'Create new Organisation'
    find('#name', visible: false).set('Harrods')
    find('#hourly_rate', visible: false).set('15.00')
    find('#create-join', visible: false).click
  end

  scenario 'Logged in user can create new organisation and join' do
    id = Organisation.last.id
    expect(page).to have_current_path(organisations_url + "/#{id}")
  end

  scenario 'Informs user when created organisation successfully' do
    expect(page).to have_content 'Organisation created successfully!'
  end

  # scenario 'Informs user when organisation name is already taken' do
  #   @organisation = create(:organisation)
  
  #   click_button 'Create new Organisation'
  #   find('#name', visible: false).set('Hogwarts')
  #   find('#hourly_rate', visible: false).set('15.00')
  #   find('#create-join', visible: false).click

  #   expect(page).to have_content "Name #{@organisation.name} is already taken! Please choose other name"
  # end
end