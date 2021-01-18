FactoryBot.define do
  factory :registration do
    association :classroom
    association :teacher
  end
end
