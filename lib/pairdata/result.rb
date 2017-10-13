# encoding: UTF-8

module Pairdata
  class Result
    ALLOWED_ATTRIBUTES = ['appExamName', 'appPCTNumber', 'appStatus', 'appStatusDate',
                          'applId', 'applIdStr', 'firstNamedApplicant', 'firstNamedApplicantNameList',
                          'firstNamedApplicantName', 'intlFilingDate', 'patentIssueDate',
                          'patentNumber', 'patentTitle', 'primaryInventor',
                          'primaryInventorFirstName', 'primaryInventorLastName',
                          'primaryInventorMiddleName', 'wipoEarlyPubDate', 'wipoEarlyPubNumber']

    ALLOWED_ATTRIBUTES.each do |att|
      attr_accessor att.to_sym
    end

    attr_accessor :links  
    attr_accessor :searchResponse 
    attr_accessor :queryId 
    attr_accessor :numFound 
    attr_accessor :start 
    
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
      @numFound = response['queryResults']['searchResponse']['response']['numFound']
      @start = response['queryResults']['searchResponse']['response']['start']

      ALLOWED_ATTRIBUTES.each do |att|
        self.send("#{att}=", fish_out(att))
      end
    end

    def fish_out(field)
      @response['queryResults']['searchResponse']['response']['docs'][@start.to_i][field]
    end
  end
end
