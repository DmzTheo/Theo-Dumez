require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get creation_site_internet" do
    get services_creation_site_internet_url
    assert_response :success
  end

  test "should get referencement" do
    get services_referencement_url
    assert_response :success
  end

end
