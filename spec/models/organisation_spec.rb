require 'rails_helper'
require 'helper_methods'

RSpec.describe Organisation, type: :model do
  include ActionDispatch::TestProcess::FixtureFile

  it "can create new organisation" do
    organisation = add_new_org
    assert organisation.save
    expect(organisation).to be_valid
  end

  it "validates uniqueness of organisation" do
    org_1 = add_new_org
    org_2 = Organisation.create(name: 'Hogwarts', hourly_rate: 12.50)
    expect(org_2).to_not be_valid
  end

  it "is not validated without name" do
    org = Organisation.create(name: nil, hourly_rate: 12.50)
    expect(org).to_not be_valid
  end

  it "is not validated without rate" do
    org = Organisation.create(name: 'Hogwarts', hourly_rate: nil)
    expect(org).to_not be_valid
  end
end