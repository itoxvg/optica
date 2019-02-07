class Venta < ApplicationRecord
  belongs_to :cliente
  belongs_to :usuario
  has_many :vendidos, dependent: :destroy
  has_many :productos, through: :vendidos

  accepts_nested_attributes_for :vendidos
  accepts_nested_attributes_for :cliente

  validates :folio, :cliente, presence: true
  validates :folio, uniqueness: { case_sensitive: false }
  validates :total, numericality: { greater_than: 0 }
end
