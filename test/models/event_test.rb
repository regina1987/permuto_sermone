require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "should not save event without title" do
    #presencia(da true porque imposible hacer evento sin titulo)
    @event = Event.new
    assert_not @event.valid?
  end


end
