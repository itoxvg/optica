module TiendasHelper

  def tienda_actual
    @tienda ||= Tienda.first
  end

end
