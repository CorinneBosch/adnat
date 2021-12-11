require 'rails_helper'

RSpec.feature 'Log in', type: :feature do

  before :each do
    @user = create(:user)
  end

  scenario 'Existing user can log in with correct email & password' do
    visit user_session_url
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button 'Log in'
    expect(page).to have_current_path(organisations_url)
  end

  scenario 'Unable to login with invalid details' do
    visit user_session_url
    fill_in :email, with: 'wrongpassword'
    fill_in :password, with: 'wrong@email.com'
    click_button 'Log in'
    expect(page).to have_current_path(user_session_url)
  end

  scenario 'Informs user when given invalid email or password' do
    visit user_session_url
    fill_in :email, with: 'wrongpassword'
    fill_in :password, with: 'wrong@email.com'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end