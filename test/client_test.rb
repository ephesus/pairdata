# encoding: UTF-8

require "test_helper"

class ClientTest < Minitest::Test
  def setup
    @client = Pairdata::Client.new
  end

  def teardown
    
  end

  def expose_p(method)
    Pairdata::Client.send(:public, method)

    yield

    Pairdata::Client.send(:private, method)
  end

  def test_url_config_set
    new_url = 'http://wrive.com'
    @client.set_url(new_url)

    assert_equal new_url, Pairdata.config.url
  end

  def test_clean_app_number
    expose_p(:clean_app_number) do 
      assert_raises Pairdata::BadQuery do
        @client.clean_app_number(Hash.new)
      end
    end
  end

  def test_clean_app_number_works
    expose_p(:clean_app_number) do 
      assert_equal "12345678", @client.clean_app_number('12/345,678')
    end
  end

  #terrible test, just making sure it spits out a ::Result object
  #and that the Result object has sane results
  def test_pair_sync
    return_value = YAML::load_file(File.join(__dir__, 'txt/result.txt'))

    Pairdata::Client.stub :post, return_value do
      #verify default options fail, require app number
      assert_raises Pairdata::BadQuery do
        @client.pair_sync
      end

      res = @client.pair_sync(searchText: 'random_app_num')

      assert_kind_of Pairdata::Result, res
      assert_equal 'Pil Sang Yoo , Gyeonggi-do (KR)', res.primaryInventor
    end
  end
end
