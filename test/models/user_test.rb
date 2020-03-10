require 'test_helper'

class UserTest < ActiveSupport::TestCase


  test "email should be present" do
    #presencia(mu da true porque imposible hacer usuaio sin email)
    @user=User.new
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should not be too long" do
    #imposible crear usuari com demasiado lagro email
    @user=User.new
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "should not save users with the same email " do
    #unicidad (imposible crear usuario com email repetido)
    @user1 = User.create(email:'aa@mail', password:'123456')
    @user1.save
    @user2 = User.create(email:'aa@mail', password:'123456')
    @user2.save
    assert_not @user2.valid?
  end

  test "should not save user with password shorter than 6 letters" do
    #imposible crear usuario con password menos que 6 letras
    @user = User.create(email:'aa@mail', password:'12345')
    @user.save
    assert_not @user.valid?
  end

  test "should not save user with native language practice with number " do
    #inclusion imposible crear usuario con native language con numeros
    @user = User.create(email:'aa@mail', password:'12345', native:'rus11')
    @user.save
    assert_not @user.valid?
  end

  test "should not save user with  language  for practice with numbers " do
    #inclusion imposible crear usuario con  language con numeros
    @user = User.create(email:'aa@mail', password:'12345', practico:'rus11')
    @user.save
    assert_not @user.valid?
  end



end
