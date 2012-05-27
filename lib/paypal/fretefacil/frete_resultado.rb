# encoding: UTF-8
require 'forwardable'

module PayPal
  module FreteFacil
    class FreteResultado
      extend Forwardable
      
      { :value => :valor,
        :success? => :sucesso?,
        :error? => :erro?,
        :error_message => :mensagem_erro
      }.each do |original, delegate|
        def_delegator :@shipping_result, original, delegate
      end

      def initialize(value)
        @shipping_result = PayPal::FreteFacil::ShippingResult.new(value)
      end
    end
  end
end
