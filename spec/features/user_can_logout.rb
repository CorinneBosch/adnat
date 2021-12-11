require 'rails_helper'

RSpec.feature 'Log out', type: :feature do

  before :each do
    @user = create(:user)
    visit user_session_url
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button 'Log in'
  end

  scenario 'Existing user can log in with correct email & password' do
    click_link('log-out')
    expect(page).to have_current_path(root_url)
  end

  scenario 'Informs user when successfully signed out' do
    click_link 'Log out'
    expect(page).to have_content 'Signed out successfully.'
  end
end