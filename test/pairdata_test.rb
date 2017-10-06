# encoding: UTF-8

require "test_helper"

class PairdataTest < Minitest::Test
  def setup
    @client = Pairdata::Client.new
  end

  def teardown
    
  end

  def test_that_it_has_class_variables_constants_methods
    refute_nil ::Pairdata::VERSION
    refute_nil ::Pairdata.config
  end

  def test_query
    assert true
  end
end
