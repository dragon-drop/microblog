FactoryBot.define do
  factory :post do
    association :user
    body {'Hello world!'}
  end
end
