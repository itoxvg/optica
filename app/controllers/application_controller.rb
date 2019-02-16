class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!
  layout :establecer_plantilla

  private

  def establecer_plantilla
    return 'devise' if devise_controller?
    'application'
  end
end
