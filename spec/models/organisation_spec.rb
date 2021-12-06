require 'rails_helper'

RSpec.describe Organisation, type: :model do

  it "can create new organisation" do
    organisation = add_new_organisation
    # assert organisation.save
    expect(organisation).to be_valid
  end

  it "validates uniqueness of organisation name" do
    valid_organisation = add_new_organisation
    dublicated_organisation = Organisation.create(name: 'Hogwarts', hourly_rate: 12.50)
    expect(dublicated_organisation).to_not be_valid
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