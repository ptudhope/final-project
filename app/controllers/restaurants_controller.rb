class RestaurantsController < ApplicationController
  def list
    @restaurants = Restaurant.all

    render("restaurant_templates/list.html.erb")
  end

  def details
    @restaurant = Restaurant.where({ :id => params.fetch("id_to_display") }).first

    render("restaurant_templates/details.html.erb")
  end

  def blank_form
    @restaurant = Restaurant.new

    render("restaurant_templates/blank_form.html.erb")
  end

  def save_new_info
    @restaurant = Restaurant.new

    @restaurant.address = params.fetch("address")
    @restaurant.cuisine = params.fetch("cuisine")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants", { :notice => "Restaurant created successfully." })
    else
      render("restaurant_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @restaurant = Restaurant.where({ :id => params.fetch("id_to_prefill") }).first

    render("restaurant_templates/prefilled_form.html.erb")
  end

  def save_edits
    @restaurant = Restaurant.where({ :id => params.fetch("id_to_modify") }).first

    @restaurant.address = params.fetch("address")
    @restaurant.cuisine = params.fetch("cuisine")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants/" + @restaurant.id.to_s, { :notice => "Restaurant updated successfully." })
    else
      render("restaurant_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @restaurant = Restaurant.where({ :id => params.fetch("id_to_remove") }).first

    @restaurant.destroy

    redirect_to("/restaurants", { :notice => "Restaurant deleted successfully." })
  end
end
