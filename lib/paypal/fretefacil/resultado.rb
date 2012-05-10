# encoding: UTF-8
module PayPal
  module FreteFacil
    class Resultado
      attr_reader :valor

      def initialize(valor)
        if valor > 0
          # Ruby 1.8.7 compatibility.
          @valor = Float.instance_method(:round).arity.zero? ? valor : valor.round(2)
        else
          @valor = 0
          @erro = true
          @msg_erro = "Não foi possível calcular o frete."
        end
      end

      def sucesso?
        !erro?
      end
      alias success? sucesso?

      def erro?
        @erro ||= false
      end
      alias error? erro?

      def msg_erro
        @msg_erro ||= ""
      end
      alias error_msg msg_erro
    end
  end
end
