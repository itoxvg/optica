FactoryBot.define do
  factory :pago do
    efectivo { 1 }
    anticipo { 1 }
    cambio { 0 }
    venta { nil }
  end
end
