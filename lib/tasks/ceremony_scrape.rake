require 'nokogiri'
require 'mechanize'
require 'httparty'

#require 'pry' 
#put binding.pry in to drop in a ruby terminal 

desc "Scrape Coffees from the Ceremony Coffee Website and store them in the Beans table"
task :scrape_ceremony => :environment do
    url = "https://shop.ceremonycoffee.com/collections/single-origin"
    Bean.where(roaster_id: "2").destroy_all
    mechanize = Mechanize.new
    
    mechanize.get(url) do |page|
        page.links_with(:href => /products/).each do |link|
            coffee_page = link.click
                
                bean = Bean.new
                
                bean.acidity = coffee_page.css('[data-id="acidity"]').text.strip.gsub("acidity ","")
                bean.elevation = coffee_page.css('[data-id="elevation"]').text.strip.gsub("elevation ","")
                bean.roaster_id = "2"
                bean.harvest_season = coffee_page.css('[data-id="harvest"]').text.strip.gsub("harvest ","")
                bean.price = coffee_page.css('.price-wrap').text.gsub("$","")
                bean.roast_profile = coffee_page.css('[data-id="roast"]').text.strip.gsub("roast ","")
                bean.processing_type = coffee_page.css('[data-id="process"]').text.strip.gsub("process ","")
                bean.cultivar = coffee_page.css('[data-id="cultivar"]').text.strip.gsub("cultivar ","")
                bean.flavor_profiles = coffee_page.css('.price-wrap+ p').text.strip
                bean.country_of_origin = coffee_page.css('#pdp-order h1').text.strip
                
                #trying to pull image url
                #rawpage = HTTParty.get(coffee_page)
                #doc = Nokogiri::HTML(HTTParty.get(coffee_page))
                
                #bean.image_url = coffee_page.css('img src data-featured-product-image').text
                bean.image_url = coffee_page.css('img:nth-child(6)').attr('src')
                
                if bean.country_of_origin == "Origin Set" || bean.country_of_origin == "Gift Card (online use only)"
                    bean.destroy
                else
                    bean.save
                end
                
        end
    end
end