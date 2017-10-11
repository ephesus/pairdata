# encoding: UTF-8

# Configuration object, singleton, class variable on module Pairdata

module Pairdata
  class Configuration
    #set externally
    attr_accessor :url
    attr_accessor :default_query_options

    def initialize
      #set all default values
      @url = 'https://pairbulkdata.uspto.gov/api'
      @default_query_options = {qf: 'patentTitle', 
                                searchText: ''
      }.freeze
    end
  end
end
