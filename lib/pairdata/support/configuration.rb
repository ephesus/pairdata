# encoding: UTF-8

# Configuration object, singleton, class variable on module Pairdata

module Pairdata
  class Configuration
    #set externally
    attr_accessor :url
    attr_accessor :default_pair_options

    def initialize
      #set all default values
      @url = 'https://pairbulkdata.uspto.gov/api/queries'
      @default_pair_options = {qf: 'applId', 
                                searchText: '',
                                facet: 'false'
      }.freeze
    end
  end
end
