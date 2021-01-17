FactoryBot.define do
  factory :teacher do
    name { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
  end
end
