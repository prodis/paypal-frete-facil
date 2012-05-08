# encoding: UTF-8

def fake_request(price)
  FakeWeb.register_uri(:post,
                       Regexp.new("https://ff.paypal-brasil.com.br/FretesPayPalWS/WSFretesPayPal"),
                       :status => 200,
                       :body => response_body(price))
end

def response_body(price)
  File.open(File.dirname(__FILE__) + "/responses/success_response.xml").read.gsub("[PRICE]", price.to_s)
end
