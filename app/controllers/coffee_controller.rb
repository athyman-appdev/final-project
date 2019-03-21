class CoffeeController < ApplicationController
    
    skip_before_action :authenticate_user!, :only => [:about]
   
    def about
        render("layouts/about.html.erb")
    end
    
    def profile
        
        @beans = Bean.all
        @roasters = Roaster.all
        
        @favorite_beans = FavoriteBean.where(user_id: current_user)
        @favorite_roasters = FavoriteRoaster.where(user_id: current_user)
        
        @roaster_reviews = RoasterReview.where(user_id: current_user)
        @bean_reviews = Review.where(user_id: current_user)
        
        render("layouts/profile.html.erb")
    end
    
end