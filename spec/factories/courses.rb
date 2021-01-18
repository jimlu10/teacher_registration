FactoryBot.define do
  factory :course do
    name { Faker::Job.unique.title }
  end
end
