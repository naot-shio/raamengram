FactoryBot.define do
  factory :user do
    name { |n| "example#{n}"}
    username { |n| "example user#{n}"}
    email { |n| "example#{n}@example.com"}
    password {'123456'}
    password_confirmation {'123456'}
  end
end