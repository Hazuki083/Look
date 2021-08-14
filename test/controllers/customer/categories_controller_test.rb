require 'test_helper'

class Customer::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_categories_index_url
    assert_response :success
  end

end
