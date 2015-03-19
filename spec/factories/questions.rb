FactoryGirl.define do
  factory :question do
    user
    title Faker::Hacker.say_something_smart
    content Faker::Lorem.paragraph(2)
  end

end
