class Venta < ApplicationRecord
  PRIMER_CODIGO = "1000000000016"

  before_create :asignar_siguiente_codigo

  belongs_to :cliente
  belongs_to :usuario
  has_many :vendidos, dependent: :destroy
  has_many :productos, through: :vendidos
  accepts_nested_attributes_for :vendidos

  validates :cliente, :fecha_entrega, :pago, presence: true
  validates :total, :pago, numericality: { greater_than: 0 }

  scope :recientes_primero, -> { Venta.order(created_at: :desc) }

  def suma_precios_venta
    vendidos.map { |v| v.precio_venta * v.cantidad }.reduce(0, :+)
  end

  def suma_descuentos
    vendidos.map(&:descuento).reduce(0,:+)
  end

  def to_s
    codigo
  end

  private

  def asignar_siguiente_codigo
    Codigo::Siguiente.new(self).asignar
  end
end
