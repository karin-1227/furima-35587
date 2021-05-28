FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'test'}
    first_name            {'test'}
    family_name_kana      {'test'}
    first_name_kana       {'test'}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end