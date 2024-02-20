FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '太ろウ' }
    last_name             { 'やマ田' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
