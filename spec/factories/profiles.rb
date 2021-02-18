FactoryBot.define do
    factory :profile do
      name { Faker::Name.name }
      gender { Profile.genders.keys.sample }
      birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
      mail { Faker::Internet.email }
      phone { Faker::Internet.email }
      join { Faker::Date.birthday(min_age: 5, max_age: 15) }
    end
  end