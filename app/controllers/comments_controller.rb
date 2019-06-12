class CommentsController < ApplicationController
  def list
    @comments = Comment.all

    render("comment_templates/list.html.erb")
  end

  def details
    @comment = Comment.where({ :id => params.fetch("id_to_display") }).first

    render("comment_templates/details.html.erb")
  end

  def blank_form
    @comment = Comment.new

    render("comment_templates/blank_form.html.erb")
  end

  def save_new_info
    @comment = Comment.new

    @comment.caption = params.fetch("caption")
    @comment.user_id = params.fetch("user_id")
    @comment.restaurant_id = params.fetch("restaurant_id")

    if @comment.valid?
      @comment.save

      redirect_to("/comments", { :notice => "Comment created successfully." })
    else
      render("comment_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @comment = Comment.where({ :id => params.fetch("id_to_prefill") }).first

    render("comment_templates/prefilled_form.html.erb")
  end

  def save_edits
    @comment = Comment.where({ :id => params.fetch("id_to_modify") }).first

    @comment.caption = params.fetch("caption")
    @comment.user_id = params.fetch("user_id")
    @comment.restaurant_id = params.fetch("restaurant_id")

    if @comment.valid?
      @comment.save

      redirect_to("/comments/" + @comment.id.to_s, { :notice => "Comment updated successfully." })
    else
      render("comment_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @comment = Comment.where({ :id => params.fetch("id_to_remove") }).first

    @comment.destroy

    redirect_to("/comments", { :notice => "Comment deleted successfully." })
  end
end
