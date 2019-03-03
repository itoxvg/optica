class Domicilio < ApplicationRecord
  belongs_to :domiciliable, polymorphic: true

  validates :pais, :estado, presence: true
end
