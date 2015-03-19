FactoryGirl.define do
  factory :user do
    username Faker::Name.first_name
    email Faker::Internet.email
    password "abcdefghij"
  end

end
