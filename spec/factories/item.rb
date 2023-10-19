FactoryBot.define do
  factory :item do
    association :user

    item_name    { Faker::Books::CultureSeries.book }
    explain      { Faker::Lorem.sentence }
    category_id  { Faker::Number.between(from: 2, to: 10) }
    quality_id   { Faker::Number.between(from: 2, to: 7) }
    cost_id      { Faker::Number.between(from: 2, to: 3) }
    region_id    { Faker::Number.between(from: 2, to: 48) }
    period_id    { Faker::Number.between(from: 2, to: 3) }
    price        { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/797.png'), filename: '797.png')
    end
  end
end
