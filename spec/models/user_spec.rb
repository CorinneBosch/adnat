require 'rails_helper'
require_relative'../support/helper_methods'

RSpec.describe User, type: :model do
  # include ActionDispatch::TestProcess::FixtureFile

  before :each do
    @user1 = create(:user)
  end

  it 'can create new user' do
    expect(@user1).to be_valid
  end

  it 'has unique email' do
    user2 = build(:user, email: "butterbeerh@example.com")
    expect(user2).to_not be_valid
  end

  it "stores create user in table" do
    user = add_new_user
    expect(User.count).to eq 1
  end

  describe 'validates presence' do
    let(:user) { User.new(name: 'Gandalf',
                            email: 'gandalf@example.com',
                            password: 'sauron1'
                          )
    }

    it "is not validated without name attribute" do
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not validated without email attribute" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not validated without password attribute" do
      user.password = nil
      expect(user).to_not be_valid
    end
  end
end