require 'spec_helper'

describe TelegramBotApi::HttpClient do
  let(:accepted_verb) { :get }
  let(:non_accepted_verb) { :delete }
  let(:url) { 'http://www.example.org' }
  let(:params) { {} }
  let(:headers) { { 'Content-Type'=> "application/json"} }

  describe '#make_request' do

    it 'does not complain about accepted verbs' do
      expect{described_class.make_request(verb: accepted_verb, url: url, params: params)}.to_not raise_error
    end

    it 'rejects non accepted verbs' do
      expect{described_class.make_request(verb: non_accepted_verb, url: url, params: params)}.to raise_error(ArgumentError)
    end

    it 'makes an http request with the parameters' do
      expect(Typhoeus).to receive(:get).with(url, headers: headers, params: params)
      described_class.make_request(verb: accepted_verb, url: url, params: params)
    end
  end
end
