FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { 'テスト' }
    last_name             { '太郎' }
    first_katakana        { 'テスト' }
    last_katakana         { 'タロウ' }
    birth_day             { '1998-07-06' }
  end
end
