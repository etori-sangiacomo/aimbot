require 'rest-client'
require 'json'

class ExchangeService
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end

  def perform
    exchange_api_url = 'https://currencydatafeed.com/api/data.php'
    exchange_api_key = '6501tfnvelp3q89g8c8c'
    url = "#{exchange_api_url}?token=#{exchange_api_key}&currency=#{@source_currency}/#{@target_currency}"
    res = RestClient.get url
    value = JSON.parse(res.body)['currency'][0]['value'].to_f

    value * @amount
  rescue RestClient::ExceptionWithResponse => e
    e.response
  end
end
