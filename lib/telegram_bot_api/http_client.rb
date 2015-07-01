require 'typhoeus'

module TelegramBotApi
  class HttpClient

    def self.get(url:, options: {})
      Typhoeus.get(url,  headers: {'Content-Type'=> "application/json"}, params: params)
    end

    def self.post(url:, params: {})
      Typhoeus.post(url,  headers: {'Content-Type'=> "application/json"}, params: params)
    end
  end
end
