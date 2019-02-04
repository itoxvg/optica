class Producto < ApplicationRecord
  validates :nombre, :codigo, :existencia, :precio_venta,
    :precio_compra, presence: true
  validates :precio_venta, :precio_compra,
    numericality: { greater_than: 0 }
  validates :codigo, uniqueness: { case_sensitive: false }
end
