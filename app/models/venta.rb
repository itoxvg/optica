class Venta < ApplicationRecord
  PREFIJO_CODIGO = 'V'

  before_create :asignar_siguiente_codigo

  belongs_to :cliente
  belongs_to :usuario
  has_many :vendidos, dependent: :destroy
  has_many :productos, through: :vendidos

  accepts_nested_attributes_for :vendidos
  accepts_nested_attributes_for :cliente

  validates :cliente, presence: true
  validates :total, numericality: { greater_than: 0 }

  def asignar_siguiente_codigo
    Codigo::Siguiente.new.asignar(self)
  end

  def to_s
    codigo
  end
end
