# encoding: UTF-8

module Pairdata
  class Result
    ALLOWED_ATTRIBUTES = ['queryId', 'patentTitle', 'appStatus', 'appStatusDate', 'appExamName', 'applIdStr', 'applId', 'primaryInventor', 'queryId' ]

    attr_accessor :count  
    attr_accessor :links  
    attr_accessor :searchResponse 
    attr_accessor :queryId 
    attr_accessor :patentTitle 
    attr_accessor :appStatus 
    attr_accessor :appStatusDate 
    attr_accessor :appExamName 
    attr_accessor :applIdStr 
    attr_accessor :applId
    attr_accessor :primaryInventor 

    #the whole response from httparty
    attr_accessor :response 

    def initialize(response = {})
      set_main_fields(response)
    end

    private

    def set_main_fields(response)
      @response = response
      @count = response['count']
      @links = response['links']
      
      #need to do this dynamically later
      @queryId = response['queryId']
      @appStatus = fish_out('appStatus')
      @appStatusDate = fish_out('appStatusDate')
      @appExamName = fish_out('appExamName')
      @applIdStr = fish_out('applIdStr')
      @applId = fish_out('applId')
      @primaryInventor = fish_out('primaryInventor')
      @count = fish_out('count')
      @patentTitle = fish_out('patentTitle')
    end

    def fish_out(field)
      @response['queryResults']['searchResponse']['response']['docs'][0][field]
    end
  end
end
