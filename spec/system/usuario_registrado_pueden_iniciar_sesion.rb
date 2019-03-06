require 'rails_helper'

RSpec.describe "usuario registrado puede iniciar sesion", type: :system do

  feature "cuando es vendedor" do
    given(:vendedor) { build :vendedor, email: 'noexiste@gmail.com' }

    scenario "con credenciales validas" do
      cuando_vendedor_inicia_sesion
      espero_ver_ingreso_exitosamente_al_sistema
    end

    scenario "con credenciales invalidas" do
      cuando_vendedor_inicia_sesion vendedor
      espero_ver_usuario_no_encontrado
    end
  end # context vendedor

  feature "cuando es admin" do
    given(:admin) { build :admin, email: 'noexiste@gmail.com' }

    scenario "con credenciales validas" do
      cuando_admin_inicia_sesion
      espero_ver_ingreso_exitosamente_al_sistema
    end

    scenario "con credenciales invalidas" do
      cuando_admin_inicia_sesion admin
      espero_ver_usuario_no_encontrado
    end
  end # context admin

  def espero_ver_ingreso_exitosamente_al_sistema
    expect(page).to have_content 'Ingresó exitosamente al sistema.'
  end

  def espero_ver_usuario_no_encontrado
    expect(page).to have_content 'Usuario no encontrado'
  end

end # describe "usuario registrado puede iniciar sesion"
