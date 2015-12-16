module Sheetsu
  class ErrorHandler
    include HTTParty

    def self.response_code_to_exception(response)
      case response.code
        when 404
          raise Error, 'API with given URL is not found'
        when 500
          raise Error, 'Something goes wrong'
      end
    end
  end
end