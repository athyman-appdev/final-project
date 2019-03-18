class RoastersController < ApplicationController
  def index
    @roasters = Roaster.all

    render("roaster_templates/index.html.erb")
  end

  def show
    @roaster = Roaster.find(params.fetch("id_to_display"))

    render("roaster_templates/show.html.erb")
  end

  def new_form
    @roaster = Roaster.new

    render("roaster_templates/new_form.html.erb")
  end

  def create_row
    @roaster = Roaster.new

    @roaster.roaster_name = params.fetch("roaster_name")
    @roaster.roaster_location = params.fetch("roaster_location")
    @roaster.shipping_options = params.fetch("shipping_options")
    @roaster.roaster_description = params.fetch("roaster_description")
    @roaster.image_url = params.fetch("image_url")
    @roaster.website_url = params.fetch("website_url")

    if @roaster.valid?
      @roaster.save

      redirect_back(:fallback_location => "/roasters", :notice => "Roaster created successfully.")
    else
      render("roaster_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @roaster = Roaster.find(params.fetch("prefill_with_id"))

    render("roaster_templates/edit_form.html.erb")
  end

  def update_row
    @roaster = Roaster.find(params.fetch("id_to_modify"))

    @roaster.roaster_name = params.fetch("roaster_name")
    @roaster.roaster_location = params.fetch("roaster_location")
    @roaster.shipping_options = params.fetch("shipping_options")
    @roaster.roaster_description = params.fetch("roaster_description")
    @roaster.image_url = params.fetch("image_url")
    @roaster.website_url = params.fetch("website_url")
    

    if @roaster.valid?
      @roaster.save

      redirect_to("/roasters/#{@roaster.id}", :notice => "Roaster updated successfully.")
    else
      render("roaster_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @roaster = Roaster.find(params.fetch("id_to_remove"))

    @roaster.destroy

    redirect_to("/roasters", :notice => "Roaster deleted successfully.")
  end
end
