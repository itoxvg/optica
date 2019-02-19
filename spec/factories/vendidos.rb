FactoryBot.define do
  factory :vendido do
    venta { nil }
    producto { nil }
    cantidad { 1 }
    precio_venta { 1 }
    precio_compra { 1 }
    descuento { 0 }
    subtotal { 1 }
    observaciones { "MyText" }
  end
end
