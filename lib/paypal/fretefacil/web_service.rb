# encoding: UTF-8
require 'net/http'
require 'uri'

module PayPal
  module FreteFacil
    class WebService
      URL = "https://ff.paypal-brasil.com.br/FretesPayPalWS/WSFretesPayPal"
      
      def initialize
        @uri = URI.parse(URL)
      end

      def request(frete)
        http = Net::HTTP.new(@uri.host, @uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(@uri.path)
        request["Content-Type"] = "text/xml"
        request["SoapAction"] = "#{URL}/getPreco"
        request.body = request_body_for(frete)

        response = http.request(request)
        response.body
      end

      private

      def request_body_for(frete)
        "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:frete=\"https://ff.paypal-brasil.com.br/FretesPayPalWS\">" +
          "<soapenv:Header />" +
          "<soapenv:Body>" +
            "<frete:getPreco>" +
              "<cepOrigem>#{frete.cep_origem}</cepOrigem>" +
              "<cepDestino>#{frete.cep_destino}</cepDestino>" +
              "<largura>#{frete.largura}</largura>" +
              "<altura>#{frete.altura}</altura>" +
              "<profundidade>#{frete.profundidade}</profundidade>" +
              "<peso>#{frete.peso}</peso>" +
            "</frete:getPreco>" +
          "</soapenv:Body>" +
        "</soapenv:Envelope>"
      end
    end
  end
end
