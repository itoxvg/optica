module System
  module SessionHelpers

    def cuando_vendedor_inicia_sesion(vendedor=crear_vendedor)
      cuando_visita_el_inicio_de_sesion
      cuando_ingresa_credenciales vendedor
      cuando_hace_click_en_el_boton_iniciar_sesion
      espero_ver_el_nombre_de_usuario
    end

    def crear_vendedor
      create :vendedor
    end

    def cuando_admin_inicia_sesion(admin=crear_administrador)
      cuando_visita_el_inicio_de_sesion
      cuando_ingresa_credenciales admin
      cuando_hace_click_en_el_boton_iniciar_sesion
      espero_ver_el_nombre_de_usuario
    end

    def crear_administrador
      create :administrador
    end

    def cuando_ingresa_credenciales usuario
      within('#new_usuario') do
        fill_in 'usuario_email', with: usuario.email
        fill_in 'usuario_password', with: usuario.password
      end
    end

    def cuando_hace_click_en_el_boton_iniciar_sesion
      click_button 'iniciar sesión'
    end

  end
end

RSpec.configure do |config|
  config.include System::SessionHelpers, type: :system
end
