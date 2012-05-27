# encoding: UTF-8
require 'spec_helper'

describe PayPal::FreteFacil::Shipping do
  describe ".new" do
    context "create with default value of" do
      before(:each) { @shipping = PayPal::FreteFacil::Shipping.new }

      { :width => 0,
        :height => 0,
        :length => 0,
        :weight => 0.0
      }.each do |attr, value|
        it attr do
          @shipping.send(attr).should == value
        end
      end
    end

    { :from_zip => "01000-000",
      :to_zip => "021222-222",
      :width => 15,
      :height => 2,
      :length => 30,
      :weight => 0.321
    }.each do |attr, value|
      context "when #{attr} is supplied" do
        it "sets #{attr}" do
          @shipping = PayPal::FreteFacil::Shipping.new(attr => value)
          @shipping.send(attr).should == value
        end
      end

      context "when #{attr} is supplied in a block" do
        it "sets #{attr}" do
          @shipping = PayPal::FreteFacil::Shipping.new { |f| f.send("#{attr}=", value) }
          @shipping.send(attr).should == value
        end
      end
    end
  end

  describe "#calculate" do
    around do |example|
      PayPal::FreteFacil.configure { |config| config.log_enabled = false }
      example.run
      PayPal::FreteFacil.configure { |config| config.log_enabled = true }
    end

    it "returns shipping price result" do
      fake_request(10.23)
      shipping = PayPal::FreteFacil::Shipping.new
      shipping.calculate.value.should == 10.23
    end
  end
end
