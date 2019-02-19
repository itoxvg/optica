class Api::ProductosController < ApplicationController
  def index
    @productos = Producto.buscar(params[:q]).page(params[:page])

    respond_to do |format|
      format.json { render :index, status: :ok, location: @productos.to_json }
    end
  end
end
