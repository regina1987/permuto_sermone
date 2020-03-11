class PagesController < ApplicationController

  def index
    @users = User.all
  end
  
  def calendar
  end


end
