class Empresa < ApplicationRecord
  validates :nombre, presence: true

  has_one :domicilio, as: :domiciliable, dependent: :destroy

  def to_s
    nombre
  end
end
