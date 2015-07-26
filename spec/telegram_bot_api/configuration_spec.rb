require 'spec_helper'

describe TelegramBotApi::Configuration do

  describe '#auth_token' do
    let(:token) { 'token' }

    it 'returns the auth_token' do
      subject.auth_token = token
      expect(subject.auth_token).to eq(token)
    end
  end
end
