class Producto < ApplicationRecord
  belongs_to :usuario

  validates :nombre, :codigo, :existencia, :precio_venta,
    :precio_compra, :usuario, presence: true
  validates :precio_venta, :precio_compra,
    numericality: { greater_than: 0 }
  validates :codigo, uniqueness: { case_sensitive: false }
end
