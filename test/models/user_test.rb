require 'test_helper'

class UserTest < ActiveSupport::TestCase


  test "email should be present" do
    #presencia(mu da true porque imposible hacer usuaio sin email)
    @user=User.new
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user=User.new
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end


end
