class CoffeeController < ApplicationController
    
    skip_before_action :authenticate_user!, :only => [:about]
   
    def about
        render("layouts/about.html.erb")
    end
    
end