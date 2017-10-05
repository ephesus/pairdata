# encoding: UTF-8

require "test_helper"

class PairdataTest < Minitest::Test
  def setup
    @client = Pairdata::Client.new
  end

  def teardown
    
  end

  def test_that_it_has_a_version_number
    refute_nil ::Pairdata::VERSION
  end

  def test_query

    assert true
  end
end
