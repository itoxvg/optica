require 'barby/barcode/ean_13'
require 'barby/outputter/svg_outputter'

class Codigo::Barras

  attr_accessor :modelo

  def initialize modelo
    @modelo = modelo
  end

  def convertir
    formato_svg Barby::EAN13.new(eliminar_checksum)
  end

  def eliminar_checksum
    modelo.codigo.chop!
  end

  def formato_svg codigo
    escapar_html codigo.to_svg
  end

  def escapar_html codigo
    codigo.html_safe
  end

end
