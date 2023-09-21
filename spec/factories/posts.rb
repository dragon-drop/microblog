FactoryBot.define do
  factory :post do
    user
    body { "This is my microblog post..." }
  end
end
