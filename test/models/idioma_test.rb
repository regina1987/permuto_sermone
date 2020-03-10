require 'test_helper'

class IdiomaTest < ActiveSupport::TestCase

  test "should not save idioma without name" do
    #presencia(da true porque imposible hacer idioma sin nombre)
    @idioma = Idioma.new(name:"")
    assert_not @idioma.valid?
  end

  test "should not save idioma with name shorter than 3 letters" do
      #imposible crear idioma con nombre menos que 3 letras
    @idioma = Idioma.create(name:'a')
    @idioma.save
    assert_not @idioma.valid?
  end

  test "should not save idioma with the same name " do
    #unicidad (imposible crear idioma com nombre repetido)
    @idioma1 = Idioma.create(name:'arabe')
    @idioma1.save
    @idioma2 = Idioma.create(name:'arabe')
    @idioma2.save
    assert_not @idioma2.valid?
  end

  test "should not save idioma id name consists numbers " do
    #inclusion imposible crear idioma con  lname con numeros
    @idioma = Idioma.new(name:"ru11")
    assert_not @idioma.valid?
  end


end
