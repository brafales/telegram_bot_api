module TelegramBotApi
  class Message

    attr_reader :text, :chat

    def initialize(payload)
      @message = payload["text"]
      @chat = payload["chat"]
    end
  end
end
