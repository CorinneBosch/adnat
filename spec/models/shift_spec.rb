require 'rails_helper'
require 'helper_methods'

RSpec.describe Shift, type: :model do
  include ActionDispatch::TestProcess::FixtureFile

  it "can create new shift" do
    add_new_org
    shift = add_new_shift
    expect(shift).to be_valid
  end

  it "stores create shift in table" do
    add_new_org
    shift = add_new_shift
    expect(Shift.count).to eq 1
  end

  describe 'validates presence' do
    let(:shift) { Shift.new(employee: 'Gandalf',
                            shift_start: Time.new(2021, 11, 27, 9, 30, 00),
                            shift_end: Time.new(2021, 11, 27, 18, 11, 00).strftime('%H:%M'),
                            break_length: 30,
                            organisation_id: Organisation.last.id)
    }

    it "is not validated without employee attribute" do
      add_new_org
      shift.employee = nil
      expect(shift).to_not be_valid
    end

    it "is not validated without shift_start attribute" do
      add_new_org
      shift.shift_start = nil
      expect(shift).to_not be_valid
    end

    it "is not validated without shift_end attribute" do
      add_new_org
      shift.shift_end = nil
      expect(shift).to_not be_valid
    end

    it "is not validated without break_length attribute" do
      add_new_org
      shift.break_length = nil
      expect(shift).to_not be_valid
    end

    it "is not validated without organisation_id attribute" do
      add_new_org
      shift.organisation_id = nil
      expect(shift).to_not be_valid
    end
  end
end