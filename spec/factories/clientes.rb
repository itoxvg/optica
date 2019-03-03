FactoryBot.define do
  factory :cliente do
    sequence(:nombre) { |n| "cliente#{n}" }
    telefono { "MyString" }
    rfc { "AAA111111AAA" }
  end
end
