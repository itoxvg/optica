class Pago < ApplicationRecord
  belongs_to :venta

  validates :efectivo, :anticipo, :cambio, presence: true
  validates :efectivo, :anticipo, numericality: { greater_than: 0 }
  validates :cambio, numericality: { greater_than_or_equal_to: 0 }
end
