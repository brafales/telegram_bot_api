require 'spec_helper'

describe TelegramBotApi::Message do
  let(:chat) do
    {
      "id" => 1,
      "title" => "a title"
    }
  end

  let(:text) { '/command test' }

  let(:payload) do
    {
        "message_id" => 386,
        "from" => {
          "id" => 6790814,
          "first_name" => "John",
          "last_name" => "Doe",
          "username" => "jon_doe" },
        "chat" => chat,
        "date" => 1437847450,
        "text"=> text
    }
  end

  subject { described_class.new(payload) }

  describe '#text' do

    it 'returns the text' do
      expect(subject.text).to eq(text)
    end
  end

  describe '#chat' do

    it 'returns the chat' do
      expect(subject.chat).to eq(chat)
    end
  end
end
