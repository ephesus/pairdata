# encoding: UTF-8

require "test_helper"
require 'yaml'

class ResultTest < Minitest::Test
  def setup
    @expected = { :queryId => '699e0cb2-7c58-4050-a638-8bb6ffa908ce',
                  :patentTitle => 'AUTOMATIC PILL INSPECTION APPARATUS',
                  :appStatus => 'Non Final Action Mailed',
                  :appStatusDate => '2017-06-14T04:00:00Z',
                  :appExamName => 'BOLOGNA, DOMINIC JOSEPH',
                  :applIdStr => '14/898,567',
                  :applId => '14898567',
                  :primaryInventor => 'Pil Sang Yoo , Gyeonggi-do (KR)' }

    @result = Pairdata::Result.new(YAML::load_file(File.join(__dir__, 'txt/result.txt')))
  end

  def teardown
  end

  def test_initial_object
    Pairdata::Result::ALLOWED_ATTRIBUTES.each do |att|
      assert_equal @expected[att.to_sym], @result.instance_variable_get("@#{att}")
    end
  end
end

