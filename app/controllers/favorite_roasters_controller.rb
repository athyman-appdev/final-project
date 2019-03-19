class FavoriteRoastersController < ApplicationController
  def index
    @favorite_roasters = FavoriteRoaster.all

    render("favorite_roaster_templates/index.html.erb")
  end

  def show
    @favorite_roaster = FavoriteRoaster.find(params.fetch("id_to_display"))

    render("favorite_roaster_templates/show.html.erb")
  end

  def new_form
    @favorite_roaster = FavoriteRoaster.new

    render("favorite_roaster_templates/new_form.html.erb")
  end

  def create_row
    @favorite_roaster = FavoriteRoaster.new

    @favorite_roaster.user_id = params.fetch("user_id")
    @favorite_roaster.roaster_id = params.fetch("roaster_id")

    if @favorite_roaster.valid?
      @favorite_roaster.save

      redirect_back(:fallback_location => "/roasters", :notice => "Favorite roaster created successfully.")
    else
      render("favorite_roaster_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @favorite_roaster = FavoriteRoaster.find(params.fetch("prefill_with_id"))

    render("favorite_roaster_templates/edit_form.html.erb")
  end

  def update_row
    @favorite_roaster = FavoriteRoaster.find(params.fetch("id_to_modify"))

    @favorite_roaster.user_id = params.fetch("user_id")
    @favorite_roaster.roaster_id = params.fetch("roaster_id")

    if @favorite_roaster.valid?
      @favorite_roaster.save

      redirect_to("/favorite_roasters/#{@favorite_roaster.id}", :notice => "Favorite roaster updated successfully.")
    else
      render("favorite_roaster_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @favorite_roaster = FavoriteRoaster.find(params.fetch("id_to_remove"))

    @favorite_roaster.destroy

    redirect_to("/roasters", :notice => "Favorite roaster deleted successfully.")
  end
end
