FactoryBot.define do
  factory :classroom do
    association :teacher
    association :course
  end
end
