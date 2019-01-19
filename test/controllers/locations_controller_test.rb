require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get manhattan" do
    get locations_manhattan_url
    assert_response :success
  end

  test "should get brooklyn" do
    get locations_brooklyn_url
    assert_response :success
  end

  test "should get queens" do
    get locations_queens_url
    assert_response :success
  end

  test "should get the_bronx" do
    get locations_the_bronx_url
    assert_response :success
  end

  test "should get staten_island" do
    get locations_staten_island_url
    assert_response :success
  end

end
