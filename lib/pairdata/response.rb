# encoding: UTF-8

module Pairdata
  class Response
    attr_accessor :count  
    attr_accessor :links  
    attr_accessor :searchResponse 
    attr_accessor :queryId 

    #the whole response from httparty
    attr_accessor :response 

    def initialize
    end

    private


  end
end
