namespace :add_products do
  desc "Add products from jumia"
  task from_jumia: :environment do
    AddProductsJob.set(wait: 1.minute).perform_later
    puts "Scrapp now accessing jumia for current laptops..."
  end

end
