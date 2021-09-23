# ダミー作成
FactoryBot.define do
  factory :post do
    review { Faker::Lorem.characters(number:20) }
    customer
  end
end