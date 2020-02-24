class ConversationsController < ApplicationController
  before_action :authenticate_user!
def index
  @users = User.all
  @conversations = current_user.conversations
  @received_messages = current_user.received_messages
end

def create
  if Conversation.between(params[:sender_id], params[:recipient_id]).present?
    @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
  else
    @conversation = Conversation.create!(conversation_params)
  end
  redirect_to conversation_messages_path(@conversation)
end

def show
  @user = User.find(params[:id])
  @conversations = Conversation.all
end

private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
