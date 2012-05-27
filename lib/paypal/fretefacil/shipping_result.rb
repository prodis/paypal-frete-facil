# encoding: UTF-8
module PayPal
  module FreteFacil
    class ShippingResult
      attr_reader :value

      def initialize(value)
        if value > 0
          # Ruby 1.8.7 compatibility.
          @value = Float.instance_method(:round).arity.zero? ? value : value.round(2)
        else
          @value = 0
          @error = true
          @error_message = "Não foi possível calcular o frete."
        end
      end

      def success?
        !error?
      end

      def error?
        @error ||= false
      end

      def error_message
        @error_message ||= ""
      end
    end
  end
end
