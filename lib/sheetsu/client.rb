module Sheetsu
  class Client
    include HTTParty

    def initialize(id)
      @id = id
      self.class.base_uri "https://sheetsu.com/apis"
    end

    def get
      response = self.class.get("/#{@id}")

      ErrorHandler.response_code_to_exception response
      response
    end

    def get_column(name)
      response = self.class.get("/#{@id}/column/#{name}")

      ErrorHandler.response_code_to_exception response
      response
    end

    def create(row)
      response = self.class.post("/#{@id}", body: row.to_json, headers: { 'Content-Type' => 'application/json' })

      ErrorHandler.response_code_to_exception response
      response
    end
  end
end
