class Usuario < ApplicationRecord
  enum cargo: [:cliente, :vendedor, :admin]

  has_many :armazones
  has_many :lentes
  has_many :micas

  validates :nombre, presence: true
  validates :nombre, uniqueness: { case_sensitive: false }

  devise :database_authenticatable, :recoverable, :rememberable,
    :validatable, :trackable
end
