class UsersController < ApplicationController
  before_action :set_comunas, only: [:new, :edit, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :description, :native, :practico, :photo, :comuna_id)
  end

  def set_comunas
  @comunas_array=Comuna.order(:name).pluck(:name, :id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
