class FollowRequestsController < ApplicationController
  def list
    @follow_requests = FollowRequest.all

    render("follow_request_templates/list.html.erb")
  end

  def details
    @follow_request = FollowRequest.where({ :id => params.fetch("id_to_display") }).first

    render("follow_request_templates/details.html.erb")
  end

  def blank_form
    @follow_request = FollowRequest.new

    render("follow_request_templates/blank_form.html.erb")
  end

  def save_new_info
    @follow_request = FollowRequest.new

    @follow_request.status = params.fetch("status")
    @follow_request.recipient_id = params.fetch("recipient_id")
    @follow_request.sender_id = params.fetch("sender_id")

    if @follow_request.valid?
      @follow_request.save

      redirect_to("/follow_requests", { :notice => "Follow request created successfully." })
    else
      render("follow_request_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @follow_request = FollowRequest.where({ :id => params.fetch("id_to_prefill") }).first

    render("follow_request_templates/prefilled_form.html.erb")
  end

  def save_edits
    @follow_request = FollowRequest.where({ :id => params.fetch("id_to_modify") }).first

    @follow_request.status = params.fetch("status")
    @follow_request.recipient_id = params.fetch("recipient_id")
    @follow_request.sender_id = params.fetch("sender_id")

    if @follow_request.valid?
      @follow_request.save

      redirect_to("/follow_requests/" + @follow_request.id.to_s, { :notice => "Follow request updated successfully." })
    else
      render("follow_request_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @follow_request = FollowRequest.where({ :id => params.fetch("id_to_remove") }).first

    @follow_request.destroy

    redirect_to("/follow_requests", { :notice => "Follow request deleted successfully." })
  end
end
