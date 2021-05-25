FactoryBot.define do
  factory :theme do
    association(:user)
    name { "monokai" }
  end
end
