require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do

  before :each do
    @user = create(:user)
  end

  scenario 'New user can sign up with valid input' do
    visit new_user_registration_url
    fill_in :name, with: 'Jane Doe'
    fill_in :email, with: 'jane@gmail.com'
    fill_in :password, with: 'whoam1?'
    fill_in :password_confirmation, with: 'whoam1?'
    click_button 'Sign up'
    expect(page).to have_current_path(organisations_url)
  end

  scenario 'Unable to sign up with email that already exists' do
    visit new_user_registration_url
    fill_in :name, with: 'Jane Doe'
    fill_in :email, with: @user.email
    fill_in :password, with: 'whoam1?'
    fill_in :password_confirmation, with: 'whoam1?'
    click_button 'Sign up'
    expect(page).to have_current_path(user_registration_url)
  end

  scenario 'Informs user when given email is already in use' do
    visit new_user_registration_url
    fill_in :name, with: 'Jane Doe'
    fill_in :email, with: @user.email
    fill_in :password, with: 'whoam1?'
    fill_in :password_confirmation, with: 'whoam1?'
    click_button 'Sign up'
    expect(page).to have_content 'Email has already been taken'
  end

  scenario 'Informs user when given password is too short' do
    visit new_user_registration_url
    fill_in :name, with: 'Jane Doe'
    fill_in :email, with: 'jane@gmail.com'
    fill_in :password, with: 'am1?'
    fill_in :password_confirmation, with: 'am1?'
    click_button 'Sign up'
    expect(page).to have_content 'Password is too short (minimum is 6 characters)'
  end
end