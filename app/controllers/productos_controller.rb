class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit]

  def index
    @productos = Producto.all
  end

  def show
  end

  def new
    @producto = Producto.new
  end

  def edit
  end

  def create
    @producto = Producto.new(producto_params)

    if @producto.save
      redirect_to producto_path(@producto), notice: 'El producto fue creado correctamente'
    else
      render :new
    end
  end

  private

  def set_producto
    @producto = Producto.find(params[:id])
  end

  def producto_params
    params.require(:producto).permit(
      :nombre, :codigo, :descripcion, :precio_venta, :precio_compra,
      :existencia
    )
  end
end
