namespace :naira_rate do
  desc "Check the current price exchange rate from abokifx.com"
  task from_aboki: :environment do
    NairaRateJob.set(wait: 1.minute).perform_later
    puts "Scrapp now accessing abokifx for current currency rate..."
  end

end
