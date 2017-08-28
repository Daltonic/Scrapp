namespace :destroy_sold_out do
  desc "destroy all records that are older than 3 days"
  task from_db: :environment do
    SoldOutJob.set(wait: 1.minute).perform_later
    puts "Now destroying sold out products form db..."
  end

end
