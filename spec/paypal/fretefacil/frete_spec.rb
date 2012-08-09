# encoding: UTF-8
require 'spec_helper'

describe PayPal::FreteFacil::Frete do
  describe ".new" do
    context "create with default value of" do
      before(:each) { @frete = PayPal::FreteFacil::Frete.new }

      { :largura => 0,
        :altura => 0,
        :comprimento => 0,
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
      :comprimento => 30,
      :peso => 0.321
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
    around do |example|
      PayPal::FreteFacil.configure { |config| config.log_enabled = false }
      example.run
      PayPal::FreteFacil.configure { |config| config.log_enabled = true }
    end

    it "returns shipping price result" do
      mock_request(10.23)
      frete = PayPal::FreteFacil::Frete.new
      frete.calcular.valor.should == 10.23
    end
  end
end
