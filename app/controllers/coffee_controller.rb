class CoffeeController < ApplicationController
    
    def index
        render("layouts/index.html.erb")
    end
    
    def about
        render("layouts/about.html.erb")
    end
    
end