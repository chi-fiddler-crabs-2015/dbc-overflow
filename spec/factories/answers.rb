FactoryGirl.define do
  factory :answer do
    user
    question
    content Faker::Lorem.paragraph(2)
  end

end
