require 'httparty'

module Sheetsu
  class Client
    include HTTParty

    def initialize(id)
      self.class.base_uri "sheetsu.com/apis/#{id}"
    end

    def get
      self.class.get('/')
    end
  end
end
