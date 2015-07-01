require "telegram_bot_api/version"
require "telegram_bot_api/configuration"

module TelegramBotApi
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
