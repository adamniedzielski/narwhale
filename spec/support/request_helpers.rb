module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end

  module AuthenticationHelpers

    def self.bypass_api_authentication
      
    end
  end
end