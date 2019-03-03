class Empresa < ApplicationRecord
  include Domiciliable

  validates :nombre, presence: true

  def to_s
    nombre
  end
end
