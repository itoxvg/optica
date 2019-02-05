class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update]

  def index
    @usuarios = Usuario.all
  end

  def show
  end

  def new
    @usuario = Usuario.new
  end

  def edit
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      redirect_to @usuario, notice: 'El usuario fue creado correctamente'
    else
      render :new
    end
  end

  def update
    if @usuario.update(usuario_params)
      redirect_to @usuario, notice: 'El usuario fue actualizado correctamente'
    else
      render 'edit'
    end
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(
      :nombre, :telefono, :email, :password, :password_confirmation
    )
  end
end
