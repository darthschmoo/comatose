require File.dirname(__FILE__) + '/../test_helper'

class ComatoseRootPageTest < Test::Unit::TestCase

  should "create root page" do
    Comatose.create_root_page

    assert_equal 1, Comatose.find(:all).length
  end
end

