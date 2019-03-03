require 'active_support/concern'

module Domiciliable
  extend ActiveSupport::Concern

  included do
    has_one :domicilio, as: :domiciliable, dependent: :destroy
    accepts_nested_attributes_for :domicilio, allow_destroy: true

    delegate :calle, :numero, :colonia, :codigo_postal, :municipio, :estado,
      :pais, to: :domicilio, prefix: false, allow_nil: true
  end
end
