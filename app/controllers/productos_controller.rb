class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update]

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
    @producto = current_usuario.productos.build(producto_params)

    if @producto.save
      redirect_to producto_path(@producto), notice: 'El producto fue creado correctamente'
    else
      render :new
    end
  end

  def update
    if @producto.update(producto_params)
      redirect_to @producto, notice: 'El producto fue actualizado correctamente'
    else
      render 'edit'
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
