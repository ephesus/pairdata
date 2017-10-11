# encoding: UTF-8

require 'httparty' 

require 'response' 

module Pairdata
  class Client
    #httparty uses self.included to add class methods, too.
    #Hence self.class.get method in our query() method
    include HTTParty
    base_uri Pairdata.config.url

    def initialize
    end

    def set_url(url = Pairdata.config.url)
      Pairdata.config.url = url
    end

    def handle_timeouts
      begin
        yield
        
      #thrown by httparty
      rescue Net::OpenTimeout, Net::ReadTimeout
        {}
      end
    end

    def query(query, options = {})
      handle_timeouts do
        query = self.class.get(query, options)
      end
    end
  end
end
