class Empresa < ApplicationRecord
  include Domiciliable
  mount_uploader :logotipo, LogotipoUploader

  validates :nombre, presence: true

  def to_s
    nombre
  end
end
