class Vendido < ApplicationRecord
  belongs_to :venta
  belongs_to :producto

  validates :cantidad, :precio_venta, :precio_compra,
    :descuento, :subtotal, presence: true

  validates :cantidad, :precio_venta, :precio_compra,
    :subtotal, numericality: { greater_than: 0 }

  delegate :nombre, :codigo, :tipo, to: :producto, prefix: false,
    allow_nil: true
end
