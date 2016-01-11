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

  describe "#create_bucket" do
    it "does a POST for 'backend/buckets' endpoint" do
      allow(Applicaster::Ais::Request).
        to receive(:post).
        with("backend/buckets.json", param: "param").
        and_return(api_response)

      expect(subject.create_bucket(param: "param")).to eq response
    end
  end

  describe "#apps" do
    it "does a Get request for 'backend/accounts/:account_id/buckets/:bucket_id/apps' endpoint" do
      allow(Applicaster::Ais::Request).
        to receive(:get).
        with("/backend/accounts/account-1/buckets/bucket-1/apps.json", params: "param").
        and_return(api_response)

      expect(subject.apps("bucket-1", "account-1", params: "param")).to eq response
    end
  end

  describe "#create_app" do
    it "does a POST for 'backend/accounts/:account_id/buckets/:bucket_id/apps' endpoint" do
      allow(Applicaster::Ais::Request).
        to receive(:post).
        with("/backend/accounts/account-1/buckets/bucket-1/apps.json", param: "param").
        and_return(api_response)

      expect(subject.create_app("bucket-1", "account-1", param: "param")).to eq response
    end
  end

  describe "#get_app" do
    it "does a Get request for '/apps/:id' endpoint" do
      allow(Applicaster::Ais::Request).
        to receive(:get).
        with("/backend/accounts/account-1/buckets/bucket-1/apps/1.json", params: "param").
        and_return(api_response)

      expect(subject.get_app(1, "bucket-1", "account-1", params: "param")).to eq response
    end
  end

  describe "#update_app" do
    it "does a Put for '/apps/:id' endpoint" do
      allow(Applicaster::Ais::Request).
        to receive(:put).
        with("/backend/accounts/account-1/buckets/bucket-1/apps/1.json", param: "param").
        and_return(api_response)

      expect(subject.update_app(1, "bucket-1", "account-1", param: "param")).to eq response
    end
  end
end

