namespace :update_products do
  desc "Update all products time"
  task into_db: :environment do
    UpdateProductsJob.set(wait: 1.minute).perform_later
    puts "Scrapp now updating products that are not sold out from our database..."
  end

end
