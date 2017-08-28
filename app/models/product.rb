class Product < ApplicationRecord

  def self.search(search)
    if search
      where(["name LIKE ?", "%#{search}%"]).order(checker: "asc")
    else
      all.order(checker: "asc")
    end
  end

end
