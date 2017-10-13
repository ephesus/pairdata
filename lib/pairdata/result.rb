# encoding: UTF-8

module Pairdata
  class Result
    ALLOWED_ATTRIBUTES = ['primaryInventorFirstName', 'primaryInventorMiddleName',
                          'primaryInventorLastName', 'patentIssueDate', 'intlFilingDate',
                          'appPCTNumber', 'patentNumber', 'patentTitle', 'appStatus',
                          'appStatusDate', 'appExamName', 'applIdStr', 'applId',
                          'primaryInventor']

    ALLOWED_ATTRIBUTES.each do |att|
      attr_accessor att.to_sym
    end

    attr_accessor :links  
    attr_accessor :searchResponse 
    attr_accessor :queryId 
    
    #the whole parsed_response from httparty
    attr_accessor :response 

    def initialize(response = {})
      set_main_fields(response)
    end

    private

    def set_main_fields(response)
      @response = response
      @count = response['count']
      @links = response['links']
      @queryId = response['queryId']

      ALLOWED_ATTRIBUTES.each do |att|
        self.send("#{att}=", fish_out(att))
      end
    end

    def fish_out(field)
      @response['queryResults']['searchResponse']['response']['docs'][0][field]
    end
  end
end
