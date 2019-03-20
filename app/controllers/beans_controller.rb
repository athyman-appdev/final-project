class BeansController < ApplicationController
  def index
    @beans = Bean.all
    
    @roasters = Roaster.all

    render("bean_templates/index.html.erb")
  end

  def show
    @bean = Bean.find(params.fetch("id_to_display"))
    @roaster = Roaster.find(@bean.roaster_id)
    @reviews = Review.all

    render("bean_templates/show.html.erb")
  end

  def new_form
    @bean = Bean.new

    render("bean_templates/new_form.html.erb")
  end

  def create_row
    @bean = Bean.new

    @bean.country_of_origin = params.fetch("country_of_origin")
    @bean.processing_type = params.fetch("processing_type")
    @bean.flavor_profiles = params.fetch("flavor_profiles")
    @bean.roaster_id = params.fetch("roaster_id")
    @bean.price = params.fetch("price")
    @bean.acidity = params.fetch("acidity")
    @bean.elevation = params.fetch("elevation")
    @bean.harvest_season = params.fetch("harvest_season")
    @bean.roast_profile = params.fetch("roast_profile")
    @bean.image_url = params.fetch("image_url")
    @bean.cultivar = params.fetch("cultivar")

    if @bean.valid?
      @bean.save

      redirect_back(:fallback_location => "/beans", :notice => "Bean created successfully.")
    else
      render("bean_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bean = Bean.find(params.fetch("prefill_with_id"))

    render("bean_templates/edit_form.html.erb")
  end

  def update_row
    @bean = Bean.find(params.fetch("id_to_modify"))

    @bean.country_of_origin = params.fetch("country_of_origin")
    @bean.processing_type = params.fetch("processing_type")
    @bean.flavor_profiles = params.fetch("flavor_profiles")
    @bean.roaster_id = params.fetch("roaster_id")
    @bean.price = params.fetch("price")
    @bean.acidity = params.fetch("acidity")
    @bean.elevation = params.fetch("elevation")
    @bean.harvest_season = params.fetch("harvest_season")
    @bean.roast_profile = params.fetch("roast_profile")
    @bean.image_url = params.fetch("image_url")
    @bean.cultivar = params.fetch("cultivar")

    if @bean.valid?
      @bean.save

      redirect_to("/beans/#{@bean.id}", :notice => "Bean updated successfully.")
    else
      render("bean_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @bean = Bean.find(params.fetch("id_to_remove"))

    @bean.destroy

    redirect_to("/beans", :notice => "Bean deleted successfully.")
  end
end
