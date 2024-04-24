# spec/factories/health_policies.rb
FactoryBot.define do
  factory :health_policy do
    name { Faker::Lorem.word }
    expiry_date { Faker::Date.forward(days: 30) }
    association :user
  end
end
