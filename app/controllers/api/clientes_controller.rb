class Api::ClientesController < ApplicationController

  def index
    @clientes = Cliente.buscar(params[:q]).page(params[:page])

    respond_to do |format|
      format.json { render :index, status: :ok, location: @clientes.to_json }
    end
  end

end
