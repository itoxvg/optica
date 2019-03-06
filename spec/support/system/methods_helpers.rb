module System
  module MethodsHelpers

    def cuando_visita_el_inicio_de_sesion
      visit new_usuario_session_path
      expect(page).to have_content 'iniciar sesión'
    end

    def espero_ver_el_nombre_de_usuario
      expect(page).to have_content @usuario
    end

  end
end

RSpec.configure do |config|
  config.include System::MethodsHelpers, type: :system
end
