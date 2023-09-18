FactoryBot.define do
  factory :post do
    user
    body { "Test" }
  end
end
