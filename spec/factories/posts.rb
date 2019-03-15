FactoryBot.define do
  factory :post do
    shop {'qqqqqqqq'}
    area {'lol ' * 10}
    name {'lol ' * 10}
    price {100}
    broth {100}
    description {100}
    user
  end
end