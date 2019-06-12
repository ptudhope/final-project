class LikesController < ApplicationController
  def list
    @likes = Like.all

    render("like_templates/list.html.erb")
  end

  def details
    @like = Like.where({ :id => params.fetch("id_to_display") }).first

    render("like_templates/details.html.erb")
  end

  def blank_form
    @like = Like.new

    render("like_templates/blank_form.html.erb")
  end

  def save_new_info
    @like = Like.new

    @like.user_id = params.fetch("user_id")
    @like.restaurant_id = params.fetch("restaurant_id")

    if @like.valid?
      @like.save

      redirect_to("/likes", { :notice => "Like created successfully." })
    else
      render("like_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @like = Like.where({ :id => params.fetch("id_to_prefill") }).first

    render("like_templates/prefilled_form.html.erb")
  end

  def save_edits
    @like = Like.where({ :id => params.fetch("id_to_modify") }).first

    @like.user_id = params.fetch("user_id")
    @like.restaurant_id = params.fetch("restaurant_id")

    if @like.valid?
      @like.save

      redirect_to("/likes/" + @like.id.to_s, { :notice => "Like updated successfully." })
    else
      render("like_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @like = Like.where({ :id => params.fetch("id_to_remove") }).first

    @like.destroy

    redirect_to("/likes", { :notice => "Like deleted successfully." })
  end
end
