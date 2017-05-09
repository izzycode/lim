FactoryGirl.define do
  factory :tag do
    name    { ['h1', 'h2', 'h3', 'link'].sample }
    content { Faker::Lorem.sentence }

    url
  end
end
