require 'spec_helper'

describe TelegramBotApi::Client do
  let(:verb) { :get }
  let(:endpoint_url) { 'endpoint_url' }
  let(:params) { {} }
  let(:valid) { true }
  let(:errors) { [] }
  let(:request) { double(:request, verb: verb, endpoint_url: endpoint_url, to_json: params, valid?: valid, errors: errors) }

  describe '#execute' do

    context 'with an invalid_request' do
      let(:valid) { false }
      let(:errors) { [:something] }
      it 'does complain about invalid_requests' do
        expect{described_class.execute(request)}.to raise_error(ArgumentError)
      end
    end

    it 'makes an HttpClient request' do
      expect(TelegramBotApi::HttpClient).to receive(:make_request).with(verb: verb, url: "#{described_class::TELEGRAM_API_ENDPOINT}/bot/#{endpoint_url}", params: params)
      described_class.execute(request)
    end
  end
end
