FactoryBot.define do
  factory :post do
    shop {'shop'}
    area {'tokyo'}
    name {'tonkotsu'}
    price {900}
    broth {'pork'}
    content {'Jotting down a test case'}
    user
  end
end