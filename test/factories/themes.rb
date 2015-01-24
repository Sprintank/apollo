FactoryGirl.define do
  factory :theme do
    identifier Faker::Lorem.characters(10)
  end

end
