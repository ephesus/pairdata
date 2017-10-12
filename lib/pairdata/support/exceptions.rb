module Pairdata
  class BadQuery < StandardError
    attr_reader :intel

    def initialize(msg="Invalid query format")
      @intel = { url: Pairdata.config.url }
      super(msg)
    end
  end
end
