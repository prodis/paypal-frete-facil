# encoding: UTF-8
require 'spec_helper'

describe PayPal::FreteFacil::Parser do
  describe "#parse" do
    let(:parser) { PayPal::FreteFacil::Parser.new }

    context "when XML is correct" do
      it "returns shipping price" do
        xml = response_body(8.19)
        parser.parse(xml).should == 8.19
      end

      context "and shipping price has more then two decimal places" do
        it "returns shipping price rounded to two decimal places" do
          xml = response_body(8.2261234567)
          parser.parse(xml).should == 8.23
        end
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
