class LikesController < ApplicationController


  def create
    receiver = User.find(params[:user_id])
    like = Like.new(sender: current_user, recipient: receiver)
    if like.save
      notice = { notice: 'Lie was successfully created.' }
    else
      notice = { notice: like.errors.full_messages }
    end
    redirect_to users_show_path(receiver), notice
  end





end
