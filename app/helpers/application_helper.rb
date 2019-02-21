module ApplicationHelper

  def codigo_de_barras modelo
    Codigo::Barras.new(modelo).convertir
  end

end
