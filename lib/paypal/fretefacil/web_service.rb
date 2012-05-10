# encoding: UTF-8
require 'net/https'
require 'uri'

module PayPal
  module FreteFacil
    class WebService
      URL = "https://ff.paypal-brasil.com.br/FretesPayPalWS/WSFretesPayPal"

      def initialize(frete)
        @uri = URI.parse(URL)
        @frete = frete
      end

      def request!
        http = build_http

        request = build_request
        log_request(request)

        response = http.request(request)
        log_response(response)

        response.body
      end

      private

      def build_http
        http = Net::HTTP.new(@uri.host, @uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http
      end

      def build_request
        request = Net::HTTP::Post.new(@uri.path)
        request["Content-Type"] = "text/xml; charset=utf-8"
        request["SoapAction"] = "#{URL}/getPreco"
        request.body = request_body
        request
      end

      def request_body
        "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:frete=\"https://ff.paypal-brasil.com.br/FretesPayPalWS\">" +
          "<soapenv:Header />" +
          "<soapenv:Body>" +
            "<frete:getPreco>" +
              "<cepOrigem>#{@frete.cep_origem}</cepOrigem>" +
              "<cepDestino>#{@frete.cep_destino}</cepDestino>" +
              "<largura>#{@frete.largura.round}</largura>" +
              "<altura>#{@frete.altura.round}</altura>" +
              "<profundidade>#{@frete.profundidade.round}</profundidade>" +
              "<peso>#{@frete.peso}</peso>" +
            "</frete:getPreco>" +
          "</soapenv:Body>" +
        "</soapenv:Envelope>"
      end

      def log_request(request)
        message = format_message(request) do
          message =  with_line_break { "PayPal-Frete-Facil Request:" }
          message << with_line_break { "POST #{URL}" }
        end

        PayPal::FreteFacil.log(message)
      end

      def log_response(response)
        message = format_message(response) do
          message =  with_line_break { "PayPal-Frete-Facil Response:" }
          message << with_line_break { "HTTP/#{response.http_version} #{response.code} #{response.message}" }
        end

        PayPal::FreteFacil.log(message)
      end

      def format_message(http)
        message = yield
        message << with_line_break { format_headers_for(http) } if PayPal::FreteFacil.log_level == :debug
        message << with_line_break { http.body }
      end

      def format_headers_for(http)
        # I'm using an empty block in each_header method for Ruby 1.8.7 compatibility.
        http.each_header{}.map { |name, values| "#{name}: #{values.first}" }.join("\n")
      end

      def with_line_break
        "#{yield}\n"
      end
    end
  end
end
