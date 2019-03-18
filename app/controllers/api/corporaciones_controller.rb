class Api::CorporacionesController < ApplicationController

  def index
    @corporaciones = Corporacion.page(params[:page])

    respond_to do |format|
      format.json { render :index, status: :ok, location: @corporaciones.to_json }
    end
  end

end
