class UsersLanguagesController < ApplicationController
before_action :set_userslanguages, only: [:show, :edit, :update, :destroy]

  def create
    user = User.find(current_user.id)
    lang = Language.find_or_create_by(name: params[:language][:name].downcase)
        if user.languages.include?(lang)
          notice = {notice: 'you just write this language'}
        elsif lang.name.length <1
          notice = {notice: 'this language es empty'}
        else
          notice = {notice: 'new language'}
        user.languages << lang
        end
    user.save
    redirect_to users_points_path, notice

  end

  def destroy
  @user.languages.delete(@language)
  respond_to do |format|
    format.html { redirect_to users_points_url, notice: 'relacion was successfully destroyed.' }
    format.json { head :no_content }
  end
end

  private

def set_userslanguages
  @user = User.find(current_user.id)
  @language = Language.find(params[:language_id])
end

end
