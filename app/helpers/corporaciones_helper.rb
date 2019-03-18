module CorporacionesHelper

  def opciones_de_corporaciones
    Corporacion.all.map { |m| [m, m.id] }
  end

end
