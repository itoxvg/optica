class Producto < ApplicationRecord
  belongs_to :usuario

  validates :nombre, :codigo, :existencia, :precio_venta,
    :usuario, :tipo, :type, presence: true
  validates :precio_venta, numericality: { greater_than: 0 }
  validates :codigo, uniqueness: { case_sensitive: false }
end
