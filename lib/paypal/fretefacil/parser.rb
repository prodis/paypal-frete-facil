# encoding: UTF-8
require 'nokogiri'

module PayPal
  module FreteFacil
    class Parser
      def parse(xml)
        Nokogiri::XML(xml).root.elements.children.children.children.text.to_f
      end
    end
  end
end
