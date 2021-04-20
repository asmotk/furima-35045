FactoryBot.define do
  factory :order_address do
    postal_code       { '123-4567' }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { Faker::Address.city }
    address_number    { Faker::Address.street_address }
    phone_number      { Faker::Number.leading_zero_number(digits: 11) }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
