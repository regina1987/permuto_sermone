require 'test_helper'

class ConversationTest < ActiveSupport::TestCase

  test "should not save conversation with  same sender and recipient" do
    #unicidad( imposible crear una conversation con mismo sender y recipient)
    @user1 = User.create(email:'aa@mail', password:'123456')
    @user1.save
    @conversation=Conversation.new(sender: @user1, recipient: @user1)
    assert_not @conversation.valid?
 end

 test "should not save conversation without recipient " do
   #presencia (imposible crear conversation sin recipient)
   @user = User.create(email:'aa@mail', password:'123456')
   @user.save
   @conversation=Conversation.new(sender: @user1)
   assert_not @conversation.valid?
 end

end
