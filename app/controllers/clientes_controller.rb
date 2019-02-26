class ClientesController < ApplicationController

  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.json { render :show, status: :ok, location: @cliente.to_json }
    end
  end

  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.json { render :show, status: :created, location: @cliente }
      else
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def cliente_params
    params.require(:cliente).permit(:nombre, :telefono)
  end
end