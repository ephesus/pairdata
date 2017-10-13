# encoding: UTF-8

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "pairdata"
require "minitest/autorun"

def expose_p(method)
  Pairdata::Client.send(:public, method)

  yield

  Pairdata::Client.send(:private, method)
end

