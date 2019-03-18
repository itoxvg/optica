class CorporacionesController < ApplicationController
  before_action :set_corporacion, only: [:show, :edit, :update, :destroy]

  def index
    @corporaciones = Corporacion.recientes_primero.page(params[:page])
    authorize @corporaciones
  end

  def show
  end

  def new
    @corporacion = Corporacion.new domicilio: Domicilio.new
    authorize @corporacion
  end

  def edit
  end

  def create
    @corporacion = Corporacion.new(corporacion_params)
    authorize @corporacion

    if @corporacion.save
      redirect_to @corporacion, notice: 'La corporación fue creada correctamente'
    else
      render :new
    end
  end

  def update
    if @corporacion.update(corporacion_params)
      redirect_to @corporacion, notice: 'La corporación fue actualzada correctamente'
    else
      render :edit
    end
  end

  def destroy
    @corporacion.destroy
    redirect_to corporaciones_url, notice: 'La corporación fue eliminada correctamente'
  end

  private

  def set_corporacion
    @corporacion = Corporacion.find(params[:id])
    authorize @corporacion
  end

  def corporacion_params
    params.require(:corporacion).permit(
      :nombre, :telefono, :rfc, :eslogan, :logotipo, :logotipo_cache,
      domicilio_attributes: [:id, :calle, :numero, :colonia, :codigo_postal,
                             :municipio, :estado, :pais]
    )
  end
end
