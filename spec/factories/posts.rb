FactoryBot.define do
  factory :post do
    item {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
