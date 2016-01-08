require "spec_helper"

describe Applicaster::Ais::Request do
  let(:connection)    { double("connection") }
  let(:get_response)  { double("get_response") }
  let(:post_response) { double("post_response") }

  before do
    allow(Faraday).to receive(:new).and_return(connection)
  end

  describe ".get" do
    it "creates an instance and sends #get to it" do
      instance = double("instance")
      allow(Applicaster::Ais::Request).to receive(:new).and_return(instance)
      allow(instance).to receive(:get).with('/fake_path', {}).and_return(get_response)
      expect(Applicaster::Ais::Request.get('/fake_path', {})).to eq get_response
    end
  end

  describe ".post" do
    it "creates an instance and sends #post to it" do
      instance = double("instance")
      allow(Applicaster::Ais::Request).to receive(:new).and_return(instance)
      allow(instance).to receive(:post).with('/fake_path', {}).and_return(post_response)
      expect(Applicaster::Ais::Request.post('/fake_path', {})).to eq post_response
    end
  end

  describe "#get" do
    it "returns 'get' response" do
      allow(connection)
        .to receive(:get)
        .with("/fake_path", { access_token: "test-token", param: "param" })
        .and_return(get_response)

      expect(Applicaster::Ais::Request.new.get('/fake_path',  param: "param")).to eq get_response
    end
  end

  describe "#post" do
    it "returns 'post' response" do
      allow(connection).
        to receive(:post).
        with("/fake_path", { access_token: "test-token", param: "param" }).
        and_return(post_response)

      expect(Applicaster::Ais::Request.new.post("/fake_path", param: "param")).to eq post_response
    end
  end
end
