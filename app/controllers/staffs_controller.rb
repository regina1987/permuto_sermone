class StaffsController < ApplicationController
  before_action :set_user, only: [:show,  :destroy]

  # GET /staffs
  # GET /staffs.json
  def index
      @users = User.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

private
  def set_user
    @user = User.find(params[:id])
  end
end
