class Vendido < ApplicationRecord
  belongs_to :venta
  belongs_to :producto

  validates :cantidad, :precio, :descuento, :subtotal, presence: true

  validates :cantidad, :precio, :subtotal, numericality: { greater_than: 0 }
end
