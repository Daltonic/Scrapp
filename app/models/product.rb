class Product < ApplicationRecord

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"]).order(price: "asc")
    else
      all.order(price: "asc")
    end
  end

end
