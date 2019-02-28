require 'rest-client'
require 'json'

class Gateway

  def perform 
    response = RestClient::Request.execute(
      :url => 'https://whatsapp-api-LB-1870775494.us-west-2.elb.amazonaws.com/v1/messages', 
      :method => :post,
      :body =>  {"preview_url": true, 
                 "recipient_type": "individual", 
                 "to": "5511974959339", 
                 "type": "text", 
                 "text": 
                    {"body": "Hello World - Visite: https://www.shop2gether.com.br"}
      }.to_json,
      :headers => {:Content_type => "application/json", :Authorization => 'Bearer eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE1NTExOTE0NDIsImV4cCI6MTU1MTc5NjI0Miwid2E6cmFuZCI6ODA1Nzc1MTkyMTQ3OTIwOTMzNH0.J0la4nK2CYbalUqaNTl7j5tIUAXvlJK00Qn9nEx-7nE'},
      :verify_ssl => false
    )

byebug
  rescue RestClient::ExceptionWithResponse => e
    byebug
    e.response
  end

  # def perform
  #   response = RestClient.post('https://whatsapp-api-LB-1870775494.us-west-2.elb.amazonaws.com/v1/messages', 
  #     :body => {
  #               "preview_url": true,
  #               "recipient_type": "individual",
  #               "to": "5511974959339",
  #               "type": "text",
  #               "text": {
  #                 "body": "Hello World - Visite: https://www.shop2gether.com.br"
  #               }
  #             }.to_json,
  #     :headers => {"Content_type" => "application/json", "Authorization" => 'Bearer eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE1NTExOTE0NDIsImV4cCI6MTU1MTc5NjI0Miwid2E6cmFuZCI6ODA1Nzc1MTkyMTQ3OTIwOTMzNH0.J0la4nK2CYbalUqaNTl7j5tIUAXvlJK00Qn9nEx-7nE'},
  #     :verify_ssl => false
  #   )

  # rescue RestClient::ExceptionWithResponse => e
  #   e.response
  # end
end


 