require 'test_helper'

class PlaceTest < ActiveSupport::TestCase

  test "should not save place without address" do
    #presencia(da true porque imposible hacer place sin address)
    @place = Place.new
    assert_not @place.valid?
  end

  test "should not save place without name" do
    #presencia(mu da true porque imposible hacer place sin nombre)
    @place = Place.new(address: 'Av. Larrain 5862, La Reina, Región Metropolitana')
    assert_not @place.valid?
  end

  test "should not save place with name shorter than 20 letters" do
    #imposible crear lugar con address menos que 20 letros
    @place = Place.create(name:'cafe', address: 'centro')
    @place.save
    assert_not @place.valid?
  end

end
