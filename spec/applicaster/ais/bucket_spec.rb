require 'spec_helper'

describe Applicaster::Ais::Bucket do
  subject { described_class }

  let(:client)        { double("client") }
  let(:client_result) { double("result") }
  let(:response)      { double("response") }
  let(:params)        { { account_id: "123", param: "param" } }

  before do
    allow(Applicaster::Ais::Client).to receive(:new).and_return(client)

    allow(Applicaster::Ais::Utilites::ResponseParser)
      .to receive(:build_result)
      .with(client_result)
      .and_return(response)
  end

  describe ".buckets" do
    it "returns a parsed result for buckets request" do
      allow(client).to receive(:buckets).with(params).and_return(client_result)
      expect(subject.buckets("123", params)).to eq response
    end
  end

  describe ".create" do
    it "returns a parsed result for create bucket request" do
      allow(client).to receive(:create_bucket).with(params).and_return(client_result)
      expect(subject.create("123", params)).to eq response
    end
  end
end
