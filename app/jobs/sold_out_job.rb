class SoldOutJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @products = Product.where("updated_at < ?", 3.days.ago)
    @products.each do |product|
      product.destroy!
    end
  end
end
