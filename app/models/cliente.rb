class Cliente < ApplicationRecord
  has_many :ventas

  validates :nombre, presence: true

  def to_s
    nombre
  end
end
