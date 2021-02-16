require 'modules/scraper'
include BestsellerScraper

desc "This task is called by the Heroku scheduler add-on"
task :download_bestsellers => :environment do
  puts "Downloading now..."
    # BestsellerScraper.mock_download
    BestsellerScraper.daily_download
  puts "done."
end