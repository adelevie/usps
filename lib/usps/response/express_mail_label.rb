module USPS::Response
  class ExpressMailLabel < Base
    # Result record for a city and state lookup.
    class Result < Struct.new(:zip, :city, :state); end

    def initialize(xml)
      @data = xml
    end

    # Returns a single city/state pair given a zip5
    def get(zip)
      @data[zip.to_i]
    end
    alias :[] :get
    
    # Returns all city/state data from the query results
    def data
      @data
    end
    
    # Returns all city/state data as a pure Ruby hash (e.g. no Structs as values)
    def to_h
      hash = {}
      @data.each_pair do |key, value|
        hash[key] = value.to_h
      end
      
      hash      
    end
  end
end

