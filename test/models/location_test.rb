require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  def valid_attributes
    {
      city: "Denver",
      state: "CO",
      country: "USA",
   }
end

  test "it must have a city state and country to be valid" do
    location = Location.new(valid_attributes)
    assert location.valid?
  end

  test "that missing attributes cause an invalid location" do
    location = Location.new(city: "Reno", country: "USA")
    assert location.invalid?
  end

  test "that a city must be unique to a state" do
    location_one = Location.create(valid_attributes)
    location_two = Location.create(valid_attributes)
    assert location_two.invalid?
  end

  test "that a state must be abbreviated to a length of two chars" do
    location = Location.create(valid_attributes)
    invalid_location = Location.create(city: "Denver",state: "Colorado", country: "USA")
    assert location.valid?
    assert invalid_location.invalid?
  end

  test "a state and country and only accept upper and lower case letters and spaces" do
    location = Location.create(city: "Denver", state: "D3",country: "U5A" )
    assert location.invalid?
  end

  test "a location can display a full name" do
    location = Location.create(city: "Denver", state: "CO", country: "USA")
    assert_equal "Denver, CO, USA", location.full_name
  end


end
