require 'spec_helper'

describe TelegramBotApi::Requests::SendMessage do
  let(:chat_id) { 1 }
  let(:text) { 'test' }

  let(:params) do
    {
      chat_id: chat_id,
      text: text
    }
  end

  subject do
    described_class.new(params)
  end

  describe '#to_json' do

    it 'returns the correct json' do
      expect(subject.to_json).to eq({
        chat_id: chat_id,
        text: text,
        disable_web_page_preview: nil,
        reply_to_message_id: nil,
        reply_markup: nil
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

  context 'with missing mandatory parameters' do
    let(:params) do
      {
        chat_id: 1
      }
    end

    describe '#valid?' do

      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end

    describe '#errors' do

      it 'returns the missing parameters' do
        expect(subject.errors).to eq([:text])
      end
    end
  end
end
