class Usuario < ApplicationRecord
  enum cargo: [:cliente, :vendedor, :admin]

  validates :nombre, presence: true
  validates :nombre, uniqueness: { case_sensitive: false }

  devise :database_authenticatable, :recoverable, :rememberable,
    :validatable, :trackable
end
