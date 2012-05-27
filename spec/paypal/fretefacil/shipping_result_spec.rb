# encoding: UTF-8
require 'spec_helper'

describe PayPal::FreteFacil::ShippingResult do
  describe ".new" do
    context "when shipping value is valid" do
      let(:result) { PayPal::FreteFacil::ShippingResult.new(13.87) }

      it "shipping value is the valid value" do
        result.value.should == 13.87
      end

      it "result is successful" do
        result.success?.should be_true
      end

      it "there is not error" do
        result.error?.should be_false  
      end

      it "there is not error message" do
        result.error_message.should be_empty
      end

      context "and has more than two decimal places"  do
        it "rounds shipping value to two decimal places" do
          result = PayPal::FreteFacil::ShippingResult.new(8.2261234567)
          result.value.should == 8.23
        end
      end
    end

    context "when value is not valid" do
      [0, -12, -15.8].each do |value|
        context "as #{value}" do
          let(:result) { PayPal::FreteFacil::ShippingResult.new(value) }

          it "value is zero" do
            result.value.should be_zero
          end

          it "result is not successful" do
            result.success?.should be_false
          end

          it "there is error" do
            result.error?.should be_true
          end

          it "there is error message" do
            result.error_message.should == "Não foi possível calcular o frete."
          end
        end
      end
    end
  end
end
