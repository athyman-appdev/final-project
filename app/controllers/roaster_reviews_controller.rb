class RoasterReviewsController < ApplicationController
  def index
    @roaster_reviews = RoasterReview.all

    render("roaster_review_templates/index.html.erb")
  end

  def show
    @roaster_review = RoasterReview.find(params.fetch("id_to_display"))

    render("roaster_review_templates/show.html.erb")
  end

  def new_form
    @roaster_review = RoasterReview.new

    render("roaster_review_templates/new_form.html.erb")
  end

  def create_row
    @roaster_review = RoasterReview.new

    @roaster_review.body = params.fetch("body")
    @roaster_review.user_id = params.fetch("user_id")
    @roaster_review.roaster_id = params.fetch("roaster_id")

    if @roaster_review.valid?
      @roaster_review.save

      redirect_back(:fallback_location => "/roasters", :notice => "Roaster review created successfully.")
    else
      render("roaster_review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @roaster_review = RoasterReview.find(params.fetch("prefill_with_id"))

    render("roaster_review_templates/edit_form.html.erb")
  end

  def update_row
    @roaster_review = RoasterReview.find(params.fetch("id_to_modify"))

    @roaster_review.body = params.fetch("body")
    @roaster_review.user_id = params.fetch("user_id")
    @roaster_review.roaster_id = params.fetch("roaster_id")

    if @roaster_review.valid?
      @roaster_review.save

      redirect_back(:fallback_location => "/roasters", :notice => "Roaster review updated successfully.")
    else
      render("roaster_review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @roaster_review = RoasterReview.find(params.fetch("id_to_remove"))

    @roaster_review.destroy

    redirect_back(:fallback_location => "/roasters", :notice => "Roaster review deleted successfully.")
  end
end
