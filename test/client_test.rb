# encoding: UTF-8

require "test_helper"

class ClientTest < Minitest::Test
  def setup
    @client = Pairdata::Client.new
  end

  def teardown
    
  end

  def test_url_config_set
    new_url = 'http://wrive.com'
    @client.set_url(new_url)

    assert_equal new_url, Pairdata.config.url
  end
end
