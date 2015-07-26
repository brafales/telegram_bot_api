require 'spec_helper'

describe TelegramBotApi::Requests::SetWebhook do
  let(:url) { 'http://www.example.org' }

  let(:params) do
    {
      url: url
    }
  end

  subject do
    described_class.new(params)
  end

  describe '#to_json' do

    it 'returns the correct json' do
      expect(subject.to_json).to eq({
        url: url
      })
    end
  end

  describe '#valid?' do

    it 'returns true' do
      expect(subject.valid?).to be true
    end
  end

  describe '#errors' do

    it 'returns an empty array' do
      expect(subject.errors).to eq([])
    end
  end
end
