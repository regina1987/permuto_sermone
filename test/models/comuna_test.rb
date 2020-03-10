require 'test_helper'

class ComunaTest < ActiveSupport::TestCase

  test "should not save comuna without name" do
    #presencia(da true porque imposible hacer comuna sin nombre)
    @comuna = Comuna.new
    @comuna.name = ""
    assert_not @comuna.valid?
  end

  test "should not save comuna with name shorter than 3 letters" do
      #imposible crear comuna con password menos que 6 letras
    @comuna = Comuna.create(name:'a')
    @comuna.save
    assert_not @comuna.valid?
  end

  test "should not save comuna with the same name " do
    #unicidad (imposible crear comuna com email repetido)
    @comuna1 = Comuna.create(name:'chile')
    @comuna1.save
    @comuna2 = Comuna.create(name:'chile')
    @comuna2.save
    assert_not @comuna2.valid?
  end

end
