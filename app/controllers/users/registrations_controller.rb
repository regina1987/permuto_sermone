# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :set_comunas, only: [:new, :edit, :create, :update]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
  def create
  super
  end

  # GET /resource/edit
   def edit
    super
  end

  # PUT /resource
  def update
   super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :description, :native, :practico, :photo, :comuna_id, :material])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :description, :native, :practico, :photo, :comuna_id, :material])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def set_comunas
  @comunas_array=Comuna.order(:name).pluck(:name, :id)
  end
end
