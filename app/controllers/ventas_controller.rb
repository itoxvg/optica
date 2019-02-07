class VentasController < ApplicationController
  before_action :set_venta, only: [:show, :edit, :update, :destroy]

  def index
    @ventas = Venta.all
  end

  def show
  end

  def new
    @venta = Venta.new
  end

  def edit
  end

  def create
    @venta = current_usuario.ventas.build(venta_params)

    if @venta.save
      redirect_to @venta, notice: 'La venta fue creada correctamente'
    else
      render :new
    end
  end

  def update
    if @venta.update(venta_params)
      redirect_to @venta, notice: 'La venta fue actualizado correctamente'
    else
      render :edit
    end
  end

  def destroy
    @venta.destroy
    redirect_to ventas_url, notice: 'La venta fue eliminada correctamente'
  end

  private

  def set_venta
    @venta = Venta.find(params[:id])
  end

  def venta_params
    params.require(:venta).permit(
      :folio, :observaciones, :saldada, :fecha_entrega,
      :descuento, :total,
      cliente_attributes: [:id, :nombre, :telefono],
      vendidos_attributes: [
        :id, :producto_id, :cantidad, :precio, :descuento, :subtotal
      ]
    )
  end
end
