require "spec_helper"

describe Myfinance::Entities::ReconcileCollection do
  let(:params) { double(headers: {}, parsed_body: [{}]) }

  subject { described_class.new(params) }

  context "#build" do
    it "returns order collection" do
      expect(subject.build).to be_a(described_class)
    end

    it "returns order" do
      subject.build
      expect(subject.collection.count).to eq(0)
    end
  end
end
