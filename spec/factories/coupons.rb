FactoryBot.define do
  factory :coupon do
    kind { "MyString" }
    code { "MyString" }
    amount { 1 }
    discount { "MyString" }
    count { 1 }
    user { nil }
  end
end
