require "spec_helper"

describe Applicaster::Ais::Response do
  describe "#data" do
    let(:response) { double(body: data) }
    subject { Applicaster::Ais::Response.new(response) }

    context "when response contains body" do
      let(:data) { { data: "data" } }

      it "returns the response body" do
        expect(subject.data).to eq(data: "data")
      end
    end

    context "when response does not contain body" do
      let(:data) { nil }

      it "raises an error and sets its message" do
        expect{ subject.data }.to raise_error Applicaster::Ais::Errors::NetworkError
      end
    end
  end

  describe "#status" do
    let(:response) { double(status: "status") }
    subject { Applicaster::Ais::Response.new(response) }

    it "returns http response status code" do
      expect(subject.status).to eq "status"
    end
  end

  describe "#error" do
    let(:response) { double(status: status) }
    subject { Applicaster::Ais::Response.new(response) }

    context "when response status is error" do
      let(:status) { 422 }

      it "returns http error status code" do
        expect(subject.error).to eq 422
      end
    end

    context "when response status not error" do
      let(:status) { 201 }

      it "returns nil" do
        expect(subject.error).to eq nil
      end
    end

  end
end
