require 'rails_helper'

RSpec.describe "usuario registrado puede iniciar sesion", type: :system do

  feature "cuando es vendedor" do
    before { @usuario = create :vendedor }

    scenario "con credenciales validas" do
      cuando_visita_el_inicio_de_sesion
      cuando_ingresa_credenciales
      cuando_hace_click_en_el_boton_iniciar_sesion
      espero_ver_el_nombre_de_usuario
      espero_ver_ingreso_exitosamente_al_sistema
    end

    scenario "con credenciales invalidas" do
      @usuario.email = 'noexiste@gmail.com'

      cuando_visita_el_inicio_de_sesion
      cuando_ingresa_credenciales
      cuando_hace_click_en_el_boton_iniciar_sesion
      espero_ver_usuario_no_encontrado
    end
  end # context vendedor

  feature "cuando es admin" do
    before { @usuario = create :admin }

    scenario "con credenciales validas" do
      cuando_visita_el_inicio_de_sesion
      cuando_ingresa_credenciales
      cuando_hace_click_en_el_boton_iniciar_sesion
      espero_ver_el_nombre_de_usuario
    end

    scenario "con credenciales invalidas" do
      @usuario.email = 'noexiste@gmail.com'

      cuando_visita_el_inicio_de_sesion
      cuando_ingresa_credenciales
      cuando_hace_click_en_el_boton_iniciar_sesion
      espero_ver_usuario_no_encontrado
    end
  end # context admin

  def cuando_visita_el_inicio_de_sesion
    visit new_usuario_session_path
    expect(page).to have_content 'iniciar sesión'
  end

  def cuando_ingresa_credenciales
    within('#new_usuario') do
      fill_in 'usuario_email', with: @usuario.email
      fill_in 'usuario_password', with: @usuario.password
    end
  end

  def cuando_hace_click_en_el_boton_iniciar_sesion
    click_button 'iniciar sesión'
  end

  def espero_ver_el_nombre_de_usuario
    expect(page).to have_content @usuario
  end

  def espero_ver_ingreso_exitosamente_al_sistema
    expect(page).to have_content 'Ingresó exitosamente al sistema.'
  end

  def espero_ver_usuario_no_encontrado
    expect(page).to have_content 'Usuario no encontrado'
  end

end # describe "usuario registrado puede iniciar sesion"
