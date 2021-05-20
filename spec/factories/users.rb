FactoryBot.define do
  factory :user do
    nickname {Facker::Name.name}
    email {Facker::Internet.free_email}
    password {'1a'+ Facker::Internet.password(min_length: 6)}
    password_confirmation {password}
    age {'11'}
end
