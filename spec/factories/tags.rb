FactoryGirl.define do
  factory :tag do
    title Faker::Name.first_name
  end

end
