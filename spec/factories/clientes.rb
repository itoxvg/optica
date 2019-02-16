FactoryBot.define do
  factory :cliente do
    sequence(:nombre) { |n| "cliente#{n}" }
    telefono { "MyString" }
  end
end
