require 'rails_helper'

RSpec.describe Category, type: :model do

    it 'order creates a payment' do
        user = User.create(email: "user@example.com", password: "1234567")
        order = Order.create(user_id: user.id, total: 100)
        pay = PaymentMethod.create(name: "Paypal Express Chechout", code:"PEC")

        Payment.start_payment_process(order, pay, "token_00998877")
        expect(order.payments.count).to eq(1)
    end
    
    it 'new payment have processing state' do
        user = User.create(email: "user@example.com", password: "1234567")
        order = Order.create(user_id: user.id, total: 100)
        pay = PaymentMethod.create(name:"Paypal Express Checkout", code:"PEC")
        
        Payment.start_payment_process(order, pay, "token_00998877")
        expect(order.payments.last.state).to eq("processing")
    end

    it 'payment changed state to completed'do
        user = User.create(email: "user@example.com", password: "1234567")
        order = Order.create(user_id: user.id, total: 100)
        order.set_state_completed
    
        expect(order.state).to eq("completed")
    end
end