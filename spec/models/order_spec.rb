require 'rails_helper'

RSpec.describe Order, type: :model do
    
    it 'pass total price to cents' do
        user = User.create(email: "user@example.com", password: "1234567")
        order = Order.create(user_id: user.id, total: 100)

        expect(order.total_in_cents).to eq(10000)
    end

    it 'order changed state to completed' do
        user = User.create(email: "user@example.com", password: "1234567")
        order = Order.create(user_id: user.id, total: 100)
        order.set_state_completed

        expect(order.state).to eq("completed")
    end
end