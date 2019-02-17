class Api::ProductosController < ApplicationController
  def index
    @productos = Producto.where("codigo ILIKE :query OR nombre ILIKE :query", query: "%#{params[:search]}%")

    respond_to do |format|
      #format.json { render json: { resultados: @productos, total_filtrados: 100 } }
      format.json { render :index, status: :ok, location: @productos.to_json }
    end
  end
end
