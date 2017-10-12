# encoding: UTF-8

module Pairdata
  class Result
    attr_accessor :count  
    attr_accessor :links  
    attr_accessor :searchResponse 
    attr_accessor :queryId 

    #the whole response from httparty
    attr_accessor :response 

    def initialize(response = {})
      set_main_fields(response)
    end

    private

    def set_main_fields(response)
      @response = response
      @count = response.parsed_response[:count]
      @links = response.parsed_response[:links]
      @queryId = response.parsed_response[:queryId]
      @count = response.parsed_response[:count]
    end
  end
end
