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
            price = item.at_css('.price').css('span')[1].attributes["data-price"].value.to_i
            if price >= 45000
              brand           = item.at_css('.brand').text
              name            = item.at_css('.name').text
              link            = item.at_css('.link').attributes["href"].value
              item_brand      = Product.find_or_initialize_by(brand:  brand, name: name, link: link, price: price)
              item_brand.save!
            end
          end
      end
    end
end
