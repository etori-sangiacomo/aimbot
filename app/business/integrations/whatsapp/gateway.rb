require 'rest-client'
require 'json'

module Integrations
  module Whatsapp
    class Gateway

      def test
          response = RestClient.post('https://whatsapp-api-LB-1870775494.us-west-2.elb.amazonaws.com/v1/messages', 
            :body => {
                      "preview_url": true,
                      "recipient_type": "individual",
                      "to": "5511974959339",
                      "type": "text",
                      "text": {
                        "body": "Hello World - Visite: https://www.shop2gether.com.br"
                      }
                    }.to_json,
            :headers => {"Content_type" => "application/json", "Authorization" => 'Bearer eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE1NTExOTE0NDIsImV4cCI6MTU1MTc5NjI0Miwid2E6cmFuZCI6ODA1Nzc1MTkyMTQ3OTIwOTMzNH0.J0la4nK2CYbalUqaNTl7j5tIUAXvlJK00Qn9nEx-7nE'},
            :verify_ssl => false
          )
      
        rescue RestClient::ExceptionWithResponse => e
          e.response
        end
    
      def call()
        handle_response do
          request = Typhoeus::Request.new(
            'https://whatsapp-api-LB-1870775494.us-west-2.elb.amazonaws.com/v1/messages',
            method: :post,
            body: {
              "preview_url": true,
              "recipient_type": "individual",
              "to": "5511974959339",
              "type": "text",
              "text": {
              "body": "Hello World - Visite: https://www.shop2gether.com.br"
              }
            },
            headers: { "Content-Type" => "application/json",
                       "Authorization" => "Bearer eyJhbGciOiAiSFMyNTYiLCAidHlwIjogIkpXVCJ9.eyJ1c2VyIjoiYWRtaW4iLCJpYXQiOjE1NTExOTE0NDIsImV4cCI6MTU1MTc5NjI0Miwid2E6cmFuZCI6ODA1Nzc1MTkyMTQ3OTIwOTMzNH0.J0la4nK2CYbalUqaNTl7j5tIUAXvlJK00Qn9nEx-7nE" }
          )
        end.body
      end


      def post(body = ["oi"])
        byebug
        response = HTTP.headers(@vtex_headers).post('https://whatsapp-api-LB-1870775494.us-west-2.elb.amazonaws.com/v1/messages', json: body)
        

        return true if response.status.to_i == 204
        fail VtexHttpError, response.status.to_i
        # handle_response do
        #   @http_requester.new(
        #     @vtex_base_url.to_s + target,
        #     method: :post,
        #     body: body,s
        #     headers: { "Content-Type" => "application/json","X-VTEX-API-AppToken" => ENV['VTEX_TOKEN'],"X-VTEX-API-AppKey" => ENV['VTEX_KEY'] }
        #   )
        # end.body
      end

      private

      def handle_response
        request = yield
        request.on_complete do |response|
          byebug
          return response if response.success?

          fail VtexHttpError, response.code
        end

        request.run
      end
    end
  end
end