class Search < ApplicationRecord
  def searched_products

    results = Product.all

    results = results.where(['name LIKE ?', "%#{keyword}%"]).order(price: "asc") if keyword.present?
    results = results.where(['brand LIKE ?', "%#{brand}%"]).order(price: "asc") if brand.present?
    results = results.where(['price <= ?', max_price]).order(price: "asc") if max_price.present?
    results = results.where(['price >= ?', min_price]).order(price: "asc") if min_price.present?

    results

  end
end
