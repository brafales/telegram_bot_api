module TelegramBotApi
  class Client
    TELEGRAM_API_ENDPOINT = "https://api.telegram.org"

    def self.set_webhook(url:)
      connection.get(set_webhook_url, url: url)
    end

    def self.send_message(message, chat_id)
      HttpClient.post(url: send_message_url, params: { chat_id: chat_id, text: message })
    end

    private

    def self.set_webhook_url
      "#{TELEGRAM_API_ENDPOINT}/#{bot_path}/setWebhook"
    end

    def self.send_message_url
      "#{TELEGRAM_API_ENDPOINT}/#{bot_path}/sendMessage"
    end

    def self.bot_path
      auth_token = TelegramBotApi.configuration.auth_token
      "bot#{auth_token}"
    end
  end
end
