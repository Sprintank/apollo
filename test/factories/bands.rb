FactoryGirl.define do
  factory :band do
    theme
    name Faker::Lorem.characters(20)
    description Faker::Lorem.characters(20)
  end
end