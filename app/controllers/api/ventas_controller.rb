class Api::VentasController < ApplicationController

  def show
    @venta = Venta.find(params[:id])

    respond_to do |format|
      format.json { render :show, status: :ok, location: @venta.to_json }
    end
  end

end
