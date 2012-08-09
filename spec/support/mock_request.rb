# encoding: UTF-8

def mock_request(price)
  url = "https://ff.paypal-brasil.com.br/FretesPayPalWS/WSFretesPayPal"
  WebMock::API.stub_request(:post, url).to_return(:status => 200, :body => response_body(price))
end

def response_body(price)
  File.open(File.dirname(__FILE__) + "/responses/success_response.xml").read.gsub("[PRICE]", price.to_s)
end
