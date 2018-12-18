require 'spec_helper'

describe Applicaster::Ais::UsageReports do
  subject { described_class }

  let(:client)        { double("client") }
  let(:client_result) { double("result") }
  let(:response)      { double("response") }

  before do
    allow(Applicaster::Ais::Client).to receive(:new).and_return(client)

    allow(Applicaster::Ais::Utilites::ResponseParser)
      .to receive(:build_result)
      .with(client_result)
      .and_return(response)
  end

  describe ".get" do
    it "returns a parsed result for usage reports request" do
      allow(client).to receive(:usage_reports).and_return(client_result)
      expect(subject.get("123", Time.now)).to eq response
    end
  end
end
