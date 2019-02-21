require 'barby/barcode/ean_13'

class Codigo::Siguiente

  attr_accessor :modelo

  def initialize modelo
    @modelo = modelo
  end

  def asignar
    return primar_codigo if es_primer_registro?
    modelo.codigo = siguiente_codigo
  end

  def es_primer_registro?
    modelo.class.count < 1
  end

  def primar_codigo
    modelo.codigo = modelo.class::PRIMER_CODIGO
  end

  def siguiente_codigo
    eliminar_checksum modelo.class.last.codigo
  end

  def eliminar_checksum codigo
    sumar_uno codigo.chop!
  end

  def sumar_uno codigo
    siguiente = (codigo.to_i + 1).to_s
    agregar_checksum siguiente
  end

  def agregar_checksum codigo
    Barby::EAN13.new(codigo).to_s
  end
end
