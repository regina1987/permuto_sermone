class ComunasController < ApplicationController

  def index
    @comunas=Comuna.all
  end

end
