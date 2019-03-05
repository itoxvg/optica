class Domicilio < ApplicationRecord
  belongs_to :domiciliable, polymorphic: true

  validates :pais, :estado, presence: true

  def to_s
    "#{calle} ##{numero} \n #{colonia} #{codigo_postal} \n #{municipio}, #{estado}"
  end
end
