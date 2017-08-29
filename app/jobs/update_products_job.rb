class UpdateProductsJob < ApplicationJob
  queue_as :default

  def perform(*arg)
    require 'nokogiri'
    require 'openssl'
    require 'open-uri'
    sold_out = 0
    for page in 1..25
        url = "https://www.jumia.com.ng/notebooks/?seller_score=4-5&page=#{page}"
        data = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
        @items = data.css('.sku').css('.name')
        @products = Product.all
        @items.each do |item|
          name = item.text
          if Product.find_by(name: name).present?
            Product.find_by(name: name).update(updated_at: Time.now)
          else
            sold_out += 1
            next
          end
        end
    end
    flash[:alert] = "#{sold_out} are now sold out!"
  end
end
