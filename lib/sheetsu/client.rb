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

    def get_column(name)
      response = self.class.get("/column/#{name}")

      ErrorHandler.response_code_to_exception response
      response
    end

    def create(body)
      options = {
        headers: { 'Content-Type' => 'application/json' },
        body: body.to_json
      }

      response = self.class.post('/', options)

      ErrorHandler.response_code_to_exception response
      response
    end
  end
end
