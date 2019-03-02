class Empresa < ApplicationRecord
  validates :nombre, presence: true

  has_one :domicilio, as: :domiciliable, dependent: :destroy
  accepts_nested_attributes_for :domicilio, allow_destroy: true

  def to_s
    nombre
  end
end
