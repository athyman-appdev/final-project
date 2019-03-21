Rails.application.routes.draw do
  # Routes for the Roaster review resource:

  # CREATE
  get("/roaster_reviews/new", { :controller => "roaster_reviews", :action => "new_form" })
  post("/create_roaster_review", { :controller => "roaster_reviews", :action => "create_row" })

  # READ
  get("/roaster_reviews", { :controller => "roaster_reviews", :action => "index" })
  get("/roaster_reviews/:id_to_display", { :controller => "roaster_reviews", :action => "show" })

  # UPDATE
  get("/roaster_reviews/:prefill_with_id/edit", { :controller => "roaster_reviews", :action => "edit_form" })
  post("/update_roaster_review/:id_to_modify", { :controller => "roaster_reviews", :action => "update_row" })

  # DELETE
  get("/delete_roaster_review/:id_to_remove", { :controller => "roaster_reviews", :action => "destroy_row" })

  #------------------------------

  # Routes for the Favorite bean resource:

  # CREATE
  get("/favorite_beans/new", { :controller => "favorite_beans", :action => "new_form" })
  post("/create_favorite_bean", { :controller => "favorite_beans", :action => "create_row" })

  # READ
  get("/favorite_beans", { :controller => "favorite_beans", :action => "index" })
  get("/favorite_beans/:id_to_display", { :controller => "favorite_beans", :action => "show" })

  # UPDATE
  get("/favorite_beans/:prefill_with_id/edit", { :controller => "favorite_beans", :action => "edit_form" })
  post("/update_favorite_bean/:id_to_modify", { :controller => "favorite_beans", :action => "update_row" })

  # DELETE
  get("/delete_favorite_bean/:id_to_remove", { :controller => "favorite_beans", :action => "destroy_row" })

  #------------------------------

  # Routes for the Favorite roaster resource:

  # CREATE
  get("/favorite_roasters/new", { :controller => "favorite_roasters", :action => "new_form" })
  post("/create_favorite_roaster", { :controller => "favorite_roasters", :action => "create_row" })

  # READ
  get("/favorite_roasters", { :controller => "favorite_roasters", :action => "index" })
  get("/favorite_roasters/:id_to_display", { :controller => "favorite_roasters", :action => "show" })

  # UPDATE
  get("/favorite_roasters/:prefill_with_id/edit", { :controller => "favorite_roasters", :action => "edit_form" })
  post("/update_favorite_roaster/:id_to_modify", { :controller => "favorite_roasters", :action => "update_row" })

  # DELETE
  get("/delete_favorite_roaster/:id_to_remove", { :controller => "favorite_roasters", :action => "destroy_row" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  get("/reviews/new", { :controller => "reviews", :action => "new_form" })
  post("/create_review", { :controller => "reviews", :action => "create_row" })

  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  get("/reviews/:id_to_display", { :controller => "reviews", :action => "show" })

  # UPDATE
  get("/reviews/:prefill_with_id/edit", { :controller => "reviews", :action => "edit_form" })
  post("/update_review/:id_to_modify", { :controller => "reviews", :action => "update_row" })

  # DELETE
  get("/delete_review/:id_to_remove", { :controller => "reviews", :action => "destroy_row" })

  #------------------------------

  # Routes for the Bean resource:

  # CREATE
  get("/beans/new", { :controller => "beans", :action => "new_form" })
  post("/create_bean", { :controller => "beans", :action => "create_row" })

  # READ
  get("/beans", { :controller => "beans", :action => "index" })
  get("/beans/:id_to_display", { :controller => "beans", :action => "show" })

  # UPDATE
  get("/beans/:prefill_with_id/edit", { :controller => "beans", :action => "edit_form" })
  post("/update_bean/:id_to_modify", { :controller => "beans", :action => "update_row" })

  # DELETE
  get("/delete_bean/:id_to_remove", { :controller => "beans", :action => "destroy_row" })

  #------------------------------

  # Routes for the Roaster resource:

  # CREATE
  get("/roasters/new", { :controller => "roasters", :action => "new_form" })
  post("/create_roaster", { :controller => "roasters", :action => "create_row" })

  # READ
  get("/roasters", { :controller => "roasters", :action => "index" })
  get("/roasters/:id_to_display", { :controller => "roasters", :action => "show" })

  # UPDATE
  get("/roasters/:prefill_with_id/edit", { :controller => "roasters", :action => "edit_form" })
  post("/update_roaster/:id_to_modify", { :controller => "roasters", :action => "update_row" })

  # DELETE
  get("/delete_roaster/:id_to_remove", { :controller => "roasters", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "beans#index"
  
  get("/", {:controller => "coffee", :action => "index"})
  get("/about", {:controller => "coffee", :action => "about"})
  get("/users/:id_to_display", {:controller => "coffee", :action => "profile"})

end
