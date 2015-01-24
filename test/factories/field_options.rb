FactoryGirl.define do
  factory :field_option do
    name Faker::Lorem.characters(10)
    identifier Faker::Lorem.characters(10)
  end

end
