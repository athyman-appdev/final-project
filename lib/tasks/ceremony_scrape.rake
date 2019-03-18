require 'nokogiri'
require 'open-uri'
require 'mechanize'

desc "Scrape Coffees from the Ceremony Coffee Website and store them in the Beans table"
task :scrape_ceremony => :environment do
    url = "https://shop.ceremonycoffee.com/collections/single-origin"
    
    doc = Nokogiri::HTML(open(url))
    
    ap doc.css("target")
end