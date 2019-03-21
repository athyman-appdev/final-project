class ReviewsController < ApplicationController
  def index
    @reviews = Review.all

    render("review_templates/index.html.erb")
  end

  def show
    @review = Review.find(params.fetch("id_to_display"))

    render("review_templates/show.html.erb")
  end

  def new_form
    @review = Review.new

    render("review_templates/new_form.html.erb")
  end

  def create_row
    @review = Review.new

    @review.body = params.fetch("body")
    @review.user_id = params.fetch("user_id")
    @review.beans_id = params.fetch("beans_id")

    if @review.valid?
      @review.save

      redirect_back(:fallback_location => "/beans", :notice => "Bean review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @review = Review.find(params.fetch("prefill_with_id"))

    render("review_templates/edit_form.html.erb")
  end

  def update_row
    @review = Review.find(params.fetch("id_to_modify"))

    @review.body = params.fetch("body")
    @review.user_id = params.fetch("user_id")
    @review.beans_id = params.fetch("beans_id")

    if @review.valid?
      @review.save

      redirect_back(:fallback_location => "/beans", :notice => "Bean review updated successfully.")
    else
      render("review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_back(:fallback_location => "/beans", :notice => "Bean review deleted successfully.")
  end
end
