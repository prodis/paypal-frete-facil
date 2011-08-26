# encoding: UTF-8
require 'spec_helper'

describe PayPal::FreteFacil::Frete do
  describe ".new" do
    context "create with default value of" do
      before(:each) { @frete = PayPal::FreteFacil::Frete.new }

      { :largura => 0,
        :altura => 0,
        :profundidade => 0,
        :peso => 0.0
      }.each do |attr, value|
        it attr do
          @frete.send(attr).should == value
        end
      end
    end

    { :cep_origem => "01000-000",
      :cep_destino => "021222-222",
      :largura => 15,
      :altura => 2,
      :profundidade => 30,
      :peso => 0.321,
      :web_service => PayPal::FreteFacil::WebService.new,
      :parser => PayPal::FreteFacil::Parser.new
    }.each do |attr, value|
      context "when #{attr} is supplied" do
        it "sets #{attr}" do
          @frete = PayPal::FreteFacil::Frete.new(attr => value)
          @frete.send(attr).should == value
        end
      end

      context "when #{attr} is supplied in a block" do
        it "sets #{attr}" do
          @frete = PayPal::FreteFacil::Frete.new { |f| f.send("#{attr}=", value) }
          @frete.send(attr).should == value
        end
      end
    end
  end

  describe "#calcular" do
    before :each do
      web_service = PayPal::FreteFacil::WebService.new
      parser = PayPal::FreteFacil::Parser.new
      @frete = PayPal::FreteFacil::Frete.new(:web_service => web_service, :parser => parser)
      
      web_service.stub(:request).with(@frete).and_return('<?xml version="1.0" encoding="UTF-8"?><S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/"><S:Body><ns2:getPrecoResponse xmlns:ns2="https://ff.paypal-brasil.com.br/FretesPayPalWS"><return>8.19</return></ns2:getPrecoResponse></S:Body></S:Envelope>')
      parser.stub(:parser).and_return(8.19)
    end

    it "returns shipping price" do
      @frete.calcular.should == 8.19
    end
  end
end
