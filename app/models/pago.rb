class Pago < ApplicationRecord
  belongs_to :venta

  validates :efectivo, :anticipo, :cambio, presence: true
  validates :efectivo, :anticipo, numericality: { greater_than: 0 }
end
