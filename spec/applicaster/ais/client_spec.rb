require "spec_helper"

describe Applicaster::Ais::Client do
  let(:api_response) { double }
  let(:response)     { double }

  before do
    allow(Applicaster::Ais::Response).to receive(:new).with(api_response).and_return(response)
  end

  describe "#buckets" do
    it "does a Get request for 'backend/buckets' endpoint" do
      allow(Applicaster::Ais::Request).
        to receive(:get).
        with("backend/buckets.json", params: "param").
        and_return(api_response)

      expect(subject.buckets(params: "param")).to eq response
    end
  end

  describe "#create" do
    it "does a POST for 'backend/buckets' endpoint" do
      allow(Applicaster::Ais::Request).
        to receive(:post).
        with("backend/buckets.json", param: "param").
        and_return(api_response)

      expect(subject.create_bucket(param: "param")).to eq response
    end
  end
end

