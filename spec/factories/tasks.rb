FactoryBot.define do
  factory :task do
    shop {'shop1'}
    area {'tokyo'}
    name {'tonkotsu'}
    price {900}
    broth {'pork'}
    description {'Jotting down a test case'}
    user
  end
end