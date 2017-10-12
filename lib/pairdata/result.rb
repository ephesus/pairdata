# encoding: UTF-8

module Pairdata
  class Result
    ALLOWED_ATTRIBUTES["queryId", "patentTitle", "appStatus", "appStatusDate", "appExamName", "applIdStr", "primaryInventor", "queryId" ]

    attr_accessor :count  
    attr_accessor :links  
    attr_accessor :searchResponse 
    attr_accessor :queryId 
    attr_accessor :patentTitle 
    attr_accessor :appStatus 
    attr_accessor :appStatusDate 
    attr_accessor :appExamName 
    attr_accessor :applIdStr 
    attr_accessor :primaryInventor 
    attr_accessor :queryId 

    #the whole response from httparty
    attr_accessor :response 

    def initialize(response = {})
      set_main_fields(response)
    end

    private

    def set_main_fields(response)
      @response = response
      @count = response.parsed_response["count"]
      @links = response.parsed_response["links"]
      
      #need to do this dynamically later
      @queryId = response.parsed_response["queryId"]
      @appStatus = response.parsed_response["queryResults"]["searchResponse"]["response"]["docs"][0]["appStatus"]
      @appStatusDate = response.parsed_response["queryResults"]["searchResponse"]["response"]["docs"][0]["appStatusDate"]
      @appExamName = response.parsed_response["queryResults"]["searchResponse"]["response"]["docs"][0]["appExamName"]
      @applIdStr = response.parsed_response["queryResults"]["searchResponse"]["response"]["docs"][0]["applIdStr"]
      @primaryInventor = response.parsed_response["queryResults"]["searchResponse"]["response"]["docs"][0]["primaryInventor"]
      @queryId = response.parsed_response["queryResults"]["searchResponse"]["response"]["docs"][0]["queryId"]
      @patentTitle = response.parsed_response["queryResults"]["searchResponse"]["response"]["docs"][0]["patentTitle"]
    end
  end
end
