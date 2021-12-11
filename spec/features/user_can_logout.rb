require 'rails_helper'

RSpec.feature 'Log out', type: :feature do

  before :each do
    @user = create(:user)
    log_in_user
    # login_as(@user, :scope => :user)
  end

  scenario 'Existing user can log in with correct email & password' do
    click_link 'Log out'
    expect(page).to have_current_path(root_url)
  end

  scenario 'Informs user when successfully signed out' do
    click_link 'Log out'
    expect(page).to have_content 'Signed out successfully.'
  end
end