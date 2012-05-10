# encoding: UTF-8
require 'spec_helper'

describe PayPal::FreteFacil::Parser do
  describe "#parse" do
    let(:parser) { PayPal::FreteFacil::Parser.new }

    context "when XML is correct" do
      it "returns shipping price" do
        xml = response_body(8.2261234567)
        parser.parse(xml).should == 8.2261234567
      end
    end

    context "when XML is not correct" do
      it "returns zero" do
        xml = "<error>Error message.</error>"
        parser.parse(xml).should be_zero
      end
    end
  end
end
