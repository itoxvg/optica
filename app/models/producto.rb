class Producto < ApplicationRecord
  belongs_to :usuario
  has_many :vendidos
  has_many :ventas, through: :vendidos

  validates :nombre, :codigo, :existencia, :precio_venta,
    :usuario, :tipo, :type, presence: true
  validates :precio_venta, numericality: { greater_than: 0 }
  validates :codigo, uniqueness: { case_sensitive: false }

  def to_s
    "#{codigo} #{nombre}"
  end
end
