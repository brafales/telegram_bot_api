require 'spec_helper'

describe TelegramBotApi do

  context 'version' do

    it 'has a version number' do
      expect(described_class::VERSION).not_to be_nil
    end
  end

  context 'configuration' do
    let(:token) { 'token' }

    it 'can be configured' do
      described_class.configure do |config|
        config.auth_token = token
      end

      expect(described_class.configuration.auth_token).to eq(token)
    end
  end
end
