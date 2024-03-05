FactoryBot.define do
  factory :item do
    name               { "名前" }
    content            { Faker::Lorem.sentence }
    category_id        { 2 }
    status_id          { 2 }
    delivery_charge_id { 2 }
    delivery_area_id   { 2 }
    delivery_date_id   { 2 }
    price              { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
