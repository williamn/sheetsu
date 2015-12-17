module Sheetsu
  class ErrorHandler
    include HTTParty

    def self.response_code_to_exception(response)
      case response.code
      when 404
        fail Error, 'API with given URL is not found'
      when 500
        fail Error, 'Something goes wrong'
      end
    end
  end
end
