class Cliente < ApplicationRecord
  has_many :ventas

  validates :nombre, presence: true
  validates :nombre, uniqueness: { case_sensitive: false }
end
