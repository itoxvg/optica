class Cliente < ApplicationRecord
  validates :nombre, presence: true
  validates :nombre, uniqueness: { case_sensitive: false }
end
