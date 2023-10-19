FactoryBot.define do
  factory :purchase_address do
    post_code    { '123-4567' }
    region_id    { Faker::Number.between(from: 2, to: 48) }
    city         { Faker::Address.city }
    home_number  { Faker::Address.street_address }
    building     { Faker::Address.community }
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    token        { "tok_abcdefghijk00000000000000000" }
  end
end
