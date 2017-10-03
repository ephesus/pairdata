# encoding: UTF-8

# Configuration object, singleton, class variable on module Pairdata

module Pairdata
  class Configuration
    #set externally
    attr_accessor :url

    def initialize
      #set all default values
      @url = 'https://pairbulkdata.uspto.gov/api'
    end
  end
end
