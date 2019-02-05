FactoryBot.define do
  factory :usuario do
    sequence(:nombre) { |n| "nombre#{n}" }
    sequence(:email) { |n| "email#{n}@mail.com" }
    password { "123456" }
  end

  trait :admin do
    cargo { 'admin' }
  end

  trait :vendedor do
    cargo { 'vendedor' }
  end

  trait :cliente do
    cargo { 'cliente' }
  end

end
