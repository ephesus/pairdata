# encoding: UTF-8

require "test_helper"

class PairdataTest < Minitest::Test
  def setup
  end

  def teardown
  end

  def test_that_it_has_class_variables_constants_methods
    refute_nil ::Pairdata::VERSION
    refute_nil ::Pairdata.config
  end

  def test_configure
    Pairdata.configure do |c|
      c.url = "a random url"
    end

    refute_equal Pairdata.config.url, Pairdata::Configuration.new.url
  end

  def test_reset_config
    Pairdata.configure do |c|
      c.url = "something not the default"
    end
    Pairdata.reset_config

    assert_equal Pairdata::Configuration.new.url, Pairdata.config.url
  end
end
