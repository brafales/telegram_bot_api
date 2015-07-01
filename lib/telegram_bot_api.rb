require "telegram_bot_api/version"
require "telegram_bot_api/configuration"
require "telegram_bot_api/http_client"
require "telegram_bot_api/client"

module TelegramBotApi

  @configuration = Configuration.new

  class << self
    attr_accessor :configuration
  end

  def self.configure
    yield(configuration)
  end
end
