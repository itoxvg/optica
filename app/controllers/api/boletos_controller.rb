class Api::BoletosController < ApplicationController
  layout "boleto"

  def ventas
    @venta = Venta.find(params[:id])

    respond_to do |format|
      format.html { render :ventas, status: :ok, location: @venta }
    end
  end
end
