require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "should not save message without body " do
    #presencia (imposible crear message sin texto)
    @user1 = User.create(email:'aa@mail', password:'123456')
    @user1.save
    @user2 = User.create(email:'bb@mail', password:'123456')
    @user2.save
    @conversation=Conversation.new(sender: @user1, recipient: @user2)
    @message=Message.create(conversation: @conversation, user: @user)
    assert_not @message.valid?
  end

end
