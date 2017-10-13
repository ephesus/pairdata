module Pairdata
  class BadQuery < StandardError
    attr_reader :intel

    def initialize(msg="Invalid query format")
      @intel = { url: Pairdata.config.url }
      super(msg)
    end
  end

  class BadAttribute < StandardError
    attr_reader :intel

    def initialize(msg="Attribute Not available/allowed")
      @intel = { url: Pairdata.config.url }
      super(msg)
    end
  end
end
