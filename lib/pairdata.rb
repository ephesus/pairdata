# encoding: UTF-8

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'pairdata')

require "version"
require "support/configuration"

module Pairdata
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield config
  end
end

require 'pairdata/client' unless defined? Pairdata::Client

