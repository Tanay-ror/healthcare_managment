FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    dob { Faker::Date.birthday }
    mobile_number { Faker::PhoneNumber.phone_number }
    password { Faker::Internet.password }

  end
end
