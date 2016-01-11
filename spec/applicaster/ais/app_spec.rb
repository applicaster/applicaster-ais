require 'spec_helper'

describe Applicaster::Ais::App do
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

  describe ".list" do
    it "returns a parsed result for apps request" do
      allow(client)
        .to receive(:apps)
        .with("bucket-1", "account-1", params)
        .and_return(client_result)

      expect(subject.list("bucket-1", "account-1", params)).to eq response
    end
  end

  describe ".post" do
    it "returns a parsed result for create app request" do
      allow(client)
        .to receive(:create_app)
        .with("bucket-1", "account-1", params)
        .and_return(client_result)

      expect(subject.post("bucket-1", "account-1", params)).to eq response
    end
  end

  describe ".get" do
    it "returns a parsed result for get app request" do
      allow(client)
        .to receive(:get_app)
        .with(1, "bucket-1", "account-1", params)
        .and_return(client_result)

      expect(subject.get(1, "bucket-1", "account-1", params)).to eq response
    end
  end

  describe ".update" do
    it "returns a parsed result for update app request" do
      allow(client)
        .to receive(:update_app)
        .with(1, "bucket-1", "account-1", params)
        .and_return(client_result)

      expect(subject.update(1, "bucket-1", "account-1", params)).to eq response
    end
  end
end
