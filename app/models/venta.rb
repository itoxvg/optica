class Venta < ApplicationRecord
  PRIMER_CODIGO = "1000000000016"

  before_create :asignar_siguiente_codigo

  belongs_to :cliente
  belongs_to :usuario
  has_many :vendidos, dependent: :destroy
  has_many :productos, through: :vendidos

  accepts_nested_attributes_for :vendidos
  accepts_nested_attributes_for :cliente

  validates :cliente, :fecha_entrega, :pago, presence: true
  validates :total, :pago, numericality: { greater_than: 0 }

  def asignar_siguiente_codigo
    Codigo::Siguiente.new(self).asignar
  end

  def to_s
    codigo
  end
end
