# encoding: UTF-8

require 'httparty' 

require 'result' 

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

    #whatever gets passed in to pair_sync gets sent to the API
    #response = client.pair_sync(appId: '234342')
    def pair_sync(options = {})
      raise Pairdata::BadQuery, 'Should be a Hash' unless options.class == Hash

      options[:searchText] = clean_app_number(options[:searchText])
      body = Pairdata.config.default_pair_options.merge(options)
      
      handle_timeouts do
        @results = self.class.post(Pairdata.config.url, {
          body: body.to_json,
          headers: { 'Content-Type' => 'application/json'}
        })
      end

      Pairdata::Result.new(@results)
    end

    private

    #remove commas and slashes 12/345,678 => 1234578
    def clean_app_number(appnum)
      raise Pairdata::BadQuery, 'Should be a string' unless appnum.class == String

      appnum.gsub(/[,\/]/,'')
    end

    def handle_timeouts
      begin
        yield
        
      #thrown by httparty
      rescue Net::OpenTimeout, Net::ReadTimeout
        {}
      end
    end
  end
end
