class Usuario < ApplicationRecord
  enum cargo: [:vendedor, :admin]

  has_many :armazones
  has_many :lentes
  has_many :micas

  validates :nombre, presence: true
  validates :nombre, uniqueness: { case_sensitive: false }

  def active_for_authentication?
    super && activo?
  end

  def inactive_message
    activo? ? super : :account_inactive
  end

  devise :database_authenticatable, :recoverable, :rememberable,
    :validatable, :trackable
end
