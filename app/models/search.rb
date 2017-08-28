class Search < ApplicationRecord
  def searched_products

    results = Product.all

    results = results.where('name LIKE ?', "%#{keyword}%").order(checker: "asc") if keyword.present?
    results = results.where('brand LIKE ?', "%#{brand}%").order(checker: "asc") if brand.present?
    results = results.where('checker >= ?', "#{max_price}").order(checker: "asc") if max_price.present?
    results = results.where('checker <= ?', "#{min_price}").order(checker: "asc") if min_price.present?

    results

  end
end
