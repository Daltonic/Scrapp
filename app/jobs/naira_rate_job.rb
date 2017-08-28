class NairaRateJob < ApplicationJob
  queue_as :default

  def perform(*arg)
    require 'nokogiri'
    require 'openssl'
    require 'open-uri'
    url = "https://abokifx.com/"
    #url = "C:/Users/Eletonic PC/Downloads/Compressed/wamp server/aboki/index.html"
    data = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    @docs = data.css('.lagos-market-rates-inner')
    @docs.each do |doc|
      naira = doc.css('table')[0].css('tr')[1].css('td')[1].text[0..2].to_i
      if Rate.any?
        Rate.last.update_attribute(:naira, naira)
      else
        rate  = Rate.find_or_initialize_by(naira: naira)
        rate.save!
      end
    end
  end
end
