# encoding: UTF-8

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'pairdata')

require "version"
require "support/configuration"

module Pairdata
  #create class methods and config variable on Pairdata module
  class << self
    attr_writer :config

    def config
      @config ||= Configuration.new
    end

    def reset_config
      @config = nil
    end

    def configure
      @config ||= Configuration.new
      yield @config
    end
  end
end

require 'pairdata/client' 
