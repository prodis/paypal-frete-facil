# encoding: UTF-8
module PayPal
  module FreteFacil
    class Shipping
      attr_accessor :from_zip, :to_zip
      attr_accessor :width, :height, :length, :weight
      attr_writer   :result_class

      DEFAULT_OPTIONS = {
        :width  => 0,
        :height => 0,
        :length => 0,
        :weight => 0.0
      }

      def initialize(options = {})
        DEFAULT_OPTIONS.merge(options).each do |attr, value|
          self.send("#{attr}=", value)
        end

        yield self if block_given?
      end

      def calculate
        response = web_service.request!
        value = parser.parse(response)
        result_class.new(value)
      end

      private

      def web_service
        PayPal::FreteFacil::WebService.new(self)
      end

      def parser
        @parser ||= PayPal::FreteFacil::Parser.new
      end

      def result_class
        @result_class ||= PayPal::FreteFacil::ShippingResult
      end
    end
  end
end
