FactoryBot.define do
  factory :post do
    shop {'qqqqqqqq'}
    area {'lol ' * 10}
    name {'lol ' * 10}
    price {100}
    broth {'pork'}
    description {'Very tasty'}
    user
  end
end