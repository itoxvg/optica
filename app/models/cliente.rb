class Cliente < ApplicationRecord
  include Domiciliable

  has_many :ventas

  validates :nombre, presence: true
  validates :nombre, uniqueness: { case_sensitive: false }

  def to_s
    nombre
  end
end
