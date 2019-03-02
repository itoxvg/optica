class Venta < ApplicationRecord
  PRIMER_CODIGO = "1000000000016"

  before_save :comprobar_estado_de_pago
  before_create :asignar_siguiente_codigo

  belongs_to :cliente
  belongs_to :usuario
  has_many :vendidos, dependent: :destroy
  has_many :productos, through: :vendidos
  has_many :pagos, dependent: :destroy

  accepts_nested_attributes_for :vendidos
  accepts_nested_attributes_for :pagos

  validates :cliente, :fecha_entrega, presence: true
  validates :total, numericality: { greater_than: 0 }

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

  def comprobar_estado_de_pago
    self.saldada = anticipos_mayor_o_igual_que_total?
  end

  def anticipos_mayor_o_igual_que_total?
    self.pagos.map(&:anticipo).reduce(0,:+) >= self.total
  end

  def asignar_siguiente_codigo
    Codigo::Siguiente.new(self).asignar
  end
end
