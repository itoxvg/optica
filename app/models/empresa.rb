class Empresa < ApplicationRecord
  validates :nombre, presence: true

  def to_s
    nombre
  end
end
