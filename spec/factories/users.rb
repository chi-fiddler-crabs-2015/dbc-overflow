FactoryGirl.define do
  factory :user do
    username Faker::Lorem.characters(10)
    email Faker::Internet.email
    password "abcdefgh12038091823098"
  end

end
