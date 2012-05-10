# encoding: UTF-8
require 'spec_helper'

describe PayPal::FreteFacil::Resultado do
  describe ".new" do
    context "when shipping value is valid" do
      let(:resultado) { PayPal::FreteFacil::Resultado.new(13.87) }

      it "shipping value is the valid value" do
        resultado.valor.should == 13.87
      end

      it "result is successful" do
        resultado.sucesso?.should be_true
      end

      it "there is not error" do
        resultado.erro?.should be_false  
      end

      it "there is not error message" do
        resultado.msg_erro.should be_empty
      end

      context "and has more than two decimal places"  do
        it "rounds shipping value to two decimal places" do
          resultado = PayPal::FreteFacil::Resultado.new(8.2261234567)
          resultado.valor.should == 8.23
        end
      end
    end

    context "when value is not valid" do
      [0, -12, -15.8].each do |value|
        context "as #{value}" do
          let(:resultado) { PayPal::FreteFacil::Resultado.new(value) }

          it "valor is zero" do
            resultado.valor.should be_zero
          end

          it "result is not successful" do
            resultado.sucesso?.should be_false
          end

          it "there is error" do
            resultado.erro?.should be_true
          end

          it "there is error message" do
            resultado.msg_erro.should == "Não foi possível calcular o frete."
          end
        end
      end
    end
  end
end
