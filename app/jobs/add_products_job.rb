class AddProductsJob < ApplicationJob
  queue_as :default

    def perform(*arg)
      require 'nokogiri'
      require 'openssl'
      require 'open-uri'
      for page in 1..25
        url = "https://www.jumia.com.ng/notebooks/?seller_score=4-5&page=#{page}"
        #url = "C:/Users/Eletonic PC/Downloads/Compressed/wamp server/exe/index.html"
        data = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
        @items = data.css('.sku')
          @items.each do |item|
            checking = item.at_css('.price').css('span')[1].text[0..2].to_i
            if checking >= 45
              brand           = item.at_css('.brand').text
              name            = item.at_css('.name').text
              price           = "₦ #{item.at_css('.price').css('span')[1].text}"
              link            = item.at_css('.link').attributes["href"].value
              checker         = item.at_css('.price').css('span')[1].text[0..2].to_i
              item_brand      = Product.find_or_initialize_by(brand:  brand, name: name, price: price, link: link, checker: checker)
              item_brand.save!
            end
          end
      end
    end
end
