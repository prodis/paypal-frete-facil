# encoding: UTF-8
module PayPal
  module FreteFacil
    class Frete
      attr_accessor :cep_origem, :cep_destino
      attr_accessor :largura, :altura, :profundidade
      attr_accessor :peso

      alias comprimento  profundidade
      alias comprimento= profundidade=

      DEFAULT_OPTIONS = {
        :largura => 0,
        :altura => 0,
        :profundidade => 0,
        :peso => 0.0
      }

      def initialize(options = {})
        DEFAULT_OPTIONS.merge(options).each do |attr, value|
          self.send("#{attr}=", value)
        end

        yield self if block_given?
      end

      def web_service
        PayPal::FreteFacil::WebService.new(self)
      end

      def parser
        @parser ||= PayPal::FreteFacil::Parser.new
      end

      def calcular
        response = web_service.request!
        value = parser.parse(response)
        PayPal::FreteFacil::Resultado.new(value)
      end

      alias calculate calcular
    end
  end
end
