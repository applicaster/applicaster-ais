require "spec_helper"

describe Applicaster::Ais do
  context "configuration" do
    it "takes block to set config" do
      configure_access_token

      expect(Applicaster::Ais.config.access_token).to eq "test-token"
    end

    it "can be accessed after being set" do
      configure_access_token
      Applicaster::Ais.config.access_token = "new-token"
      expect(Applicaster::Ais.config.access_token).to eq "new-token"
    end

  end
end
