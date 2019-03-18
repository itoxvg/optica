class Cliente < ApplicationRecord
  include Domiciliable

  belongs_to :corporacion
  has_many :ventas

  validates :nombre, :corporacion_id, presence: true
  validates :nombre, uniqueness: { case_sensitive: false }

  scope :con_corporacion, -> { includes(:corporacion) }

  def self.buscar texto
    where("concat_ws(' ', nombre, telefono, rfc) ILIKE ?", "%#{texto&.squish}%")
  end

  def to_s
    nombre
  end
end
