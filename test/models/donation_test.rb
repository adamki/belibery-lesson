require 'test_helper'

class DonationTest < ActiveSupport::TestCase

  def  valid_attributes
  {
    amount: 3,
    status: "processed",
  }
  end

  test "a donation must be in whole number" do
    donation = Donation.new(amount: 12.3)
    assert donation.invalid?
  end

  test "a donation must have a valid status" do
    donation_one = Donation.new(valid_attributes)
    donation_two = Donation.new(amount: 3, status: "unknown" )
    assert donation_two.invalid?
  end

  test "a donation should belong to a fan" do
    assert belong_to Fan
  end



end
