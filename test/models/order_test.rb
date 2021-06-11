require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "generates a random number on create" do
    user = user(:one)
    order = Order.create(user_id: user.id)
    
    assert_not order.number.nil?
  end
end
