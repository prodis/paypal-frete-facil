# encoding: UTF-8
require 'nokogiri'

module PayPal
  module FreteFacil
    class Parser
      def parse(xml)
        value = Nokogiri::XML(xml).xpath("//return").text.to_f
        Float.instance_method(:round).arity.zero? ? value : value.round(2)
      end
    end
  end
end
