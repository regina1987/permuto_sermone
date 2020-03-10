require 'test_helper'

class LikeTest < ActiveSupport::TestCase

  test "should not save like with  same sender and recipient" do
    #unicidad( imposible crear like con mismo sender y recipient)
    @user1 = User.create(email:'aa@mail', password:'123456')
    @user1.save
    @like=Like.new(sender: @user1, recipient: @user1)
    assert_not @like.valid?
 end

 test "should not save like without recipient " do
   #presencia (imposible crear like sin recipient)
   @user = User.create(email:'aa@mail', password:'123456')
   @user.save
   @like=Like.new(sender: @user1)
   assert_not @like.valid?
 end

end
