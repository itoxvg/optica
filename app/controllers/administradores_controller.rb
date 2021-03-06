class AdministradoresController < ApplicationController
  before_action :set_administrador, only: [:show, :edit, :update]

  def index
    @administradores = Administrador.page(params[:page])
    authorize @administradores
  end

  def show
  end

  def new
    @administrador = Administrador.new
    authorize @administrador
  end

  def edit
  end

  def create
    @administrador = Administrador.new(administrador_params)
    authorize @administrador

    if @administrador.save
      redirect_to @administrador, notice: 'El administrador fue creado correctamente'
    else
      render :new
    end
  end

  def update
    if @administrador.update(administrador_params)
      redirect_to @administrador, notice: 'El administrador fue actualizado correctamente'
    else
      render 'edit'
    end
  end

  private

  def set_administrador
    @administrador = Administrador.find(params[:id])
    authorize @administrador
  end

  def administrador_params
    params.require(:administrador).permit(
      :nombre, :telefono, :email, :password, :password_confirmation,
      :activo, :notificar
    )
  end
end
