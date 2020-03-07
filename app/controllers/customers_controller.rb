class CustomersController < ApplicationController
  before_action :set_user, only:[:destroy,  :show]

    def index
      @users = User.all
    end

    def show
    end

      def destroy
  	    @user.destroy
  	  end

private

      def set_user
        @user= User.find(params[:id])
      end

end
