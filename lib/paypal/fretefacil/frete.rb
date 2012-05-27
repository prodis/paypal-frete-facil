# encoding: UTF-8
require 'forwardable'

module PayPal
  module FreteFacil
    class Frete
      extend Forwardable

      # Attribute delegates
      { :from_zip => :cep_origem,
        :to_zip => :cep_destino,
        :width => :largura,
        :height => :altura,
        :length => :comprimento,
        :weight => :peso
      }.each do |original, delegate|
        def_delegator :@shipping, original, delegate
        def_delegator :@shipping, "#{original}=".to_sym, "#{delegate}=".to_sym
      end

      # Method delegates
      def_delegator  :@shipping, :calculate, :calcular
      def_delegators :@shipping, :web_service, :parser

      def initialize(options = {})
        create_shipping

        options.each do |attr, value|
          self.send("#{attr}=", value)
        end

        yield self if block_given?
      end

      private

      def create_shipping
        @shipping = PayPal::FreteFacil::Shipping.new
        @shipping.result_class = PayPal::FreteFacil::FreteResultado
      end
    end
  end
end
