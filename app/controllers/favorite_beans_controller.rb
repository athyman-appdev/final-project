class FavoriteBeansController < ApplicationController
  def index
    @favorite_beans = FavoriteBean.all

    render("favorite_bean_templates/index.html.erb")
  end

  def show
    @favorite_bean = FavoriteBean.find(params.fetch("id_to_display"))

    render("favorite_bean_templates/show.html.erb")
  end

  def new_form
    @favorite_bean = FavoriteBean.new

    render("favorite_bean_templates/new_form.html.erb")
  end

  def create_row
    @favorite_bean = FavoriteBean.new

    @favorite_bean.user_id = params.fetch("user_id")
    @favorite_bean.bean_id = params.fetch("bean_id")

    if @favorite_bean.valid?
      @favorite_bean.save

      redirect_back(:fallback_location => "/favorite_beans", :notice => "Favorite bean created successfully.")
    else
      render("favorite_bean_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @favorite_bean = FavoriteBean.find(params.fetch("prefill_with_id"))

    render("favorite_bean_templates/edit_form.html.erb")
  end

  def update_row
    @favorite_bean = FavoriteBean.find(params.fetch("id_to_modify"))

    @favorite_bean.user_id = params.fetch("user_id")
    @favorite_bean.bean_id = params.fetch("bean_id")

    if @favorite_bean.valid?
      @favorite_bean.save

      redirect_to("/favorite_beans/#{@favorite_bean.id}", :notice => "Favorite bean updated successfully.")
    else
      render("favorite_bean_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @favorite_bean = FavoriteBean.find(params.fetch("id_to_remove"))

    @favorite_bean.destroy

    redirect_to("/favorite_beans", :notice => "Favorite bean deleted successfully.")
  end
end
