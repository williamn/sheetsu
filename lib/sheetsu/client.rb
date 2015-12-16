module Sheetsu
  class Client
    include HTTParty

    def initialize(id)
      self.class.base_uri "sheetsu.com/apis/#{id}"
    end

    def get
      response = self.class.get('/')

      ErrorHandler.response_code_to_exception response
      response
    end
  end
end
