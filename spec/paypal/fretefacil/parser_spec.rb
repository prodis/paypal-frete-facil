# encoding: UTF-8
require 'spec_helper'

describe PayPal::FreteFacil::Parser do
  describe "#parse" do
    before(:each) { @parser = PayPal::FreteFacil::Parser.new }

    context "when XML is correct" do
      it "returns shipping price" do
        xml = """<?xml version=\"1.0\" encoding=\"UTF-8\"?>
                 <S:Envelope xmlns:S=\"http://schemas.xmlsoap.org/soap/envelope/\">
                   <S:Body>
                     <ns2:getPrecoResponse xmlns:ns2=\"https://ff.paypal-brasil.com.br/FretesPayPalWS\">
                       <return>8.19</return>
                     </ns2:getPrecoResponse>
                   </S:Body>
                 </S:Envelope>"""
        @parser.parse(xml).should == 8.19
      end

      context "and shipping price has more then two decimal places" do
        it "returns shipping price rounded to two decimal places" do
          xml = """<?xml version=\"1.0\" encoding=\"UTF-8\"?>
                   <S:Envelope xmlns:S=\"http://schemas.xmlsoap.org/soap/envelope/\">
                     <S:Body>
                       <ns2:getPrecoResponse xmlns:ns2=\"https://ff.paypal-brasil.com.br/FretesPayPalWS\">
                         <return>8.2261234567</return>
                       </ns2:getPrecoResponse>
                     </S:Body>
                   </S:Envelope>"""
          @parser.parse(xml).should == 8.23
        end
      end
    end

    context "when XML is not correct" do
      it "returns zero" do
        xml = "<error>Error message.</error>"
        @parser.parse(xml).should be_zero
      end
    end
  end
end
