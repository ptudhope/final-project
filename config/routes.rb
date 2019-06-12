Rails.application.routes.draw do
  # Routes for the Follow request resource:

  # CREATE
  match("/new_follow_request_form", { :controller => "follow_requests", :action => "blank_form", :via => "get" })
  match("/insert_follow_request_record", { :controller => "follow_requests", :action => "save_new_info", :via => "post" })

  # READ
  match("/follow_requests", { :controller => "follow_requests", :action => "list", :via => "get" })
  match("/follow_requests/:id_to_display", { :controller => "follow_requests", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_follow_request_form/:id_to_prefill", { :controller => "follow_requests", :action => "prefilled_form", :via => "get" })
  match("/update_follow_request_record/:id_to_modify", { :controller => "follow_requests", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_follow_request/:id_to_remove", { :controller => "follow_requests", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  match("/new_comment_form", { :controller => "comments", :action => "blank_form", :via => "get" })
  match("/insert_comment_record", { :controller => "comments", :action => "save_new_info", :via => "post" })

  # READ
  match("/comments", { :controller => "comments", :action => "list", :via => "get" })
  match("/comments/:id_to_display", { :controller => "comments", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_comment_form/:id_to_prefill", { :controller => "comments", :action => "prefilled_form", :via => "get" })
  match("/update_comment_record/:id_to_modify", { :controller => "comments", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_comment/:id_to_remove", { :controller => "comments", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  match("/new_like_form", { :controller => "likes", :action => "blank_form", :via => "get" })
  match("/insert_like_record", { :controller => "likes", :action => "save_new_info", :via => "post" })

  # READ
  match("/likes", { :controller => "likes", :action => "list", :via => "get" })
  match("/likes/:id_to_display", { :controller => "likes", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_like_form/:id_to_prefill", { :controller => "likes", :action => "prefilled_form", :via => "get" })
  match("/update_like_record/:id_to_modify", { :controller => "likes", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_like/:id_to_remove", { :controller => "likes", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  match("/new_restaurant_form", { :controller => "restaurants", :action => "blank_form", :via => "get" })
  match("/insert_restaurant_record", { :controller => "restaurants", :action => "save_new_info", :via => "post" })

  # READ
  match("/restaurants", { :controller => "restaurants", :action => "list", :via => "get" })
  match("/restaurants/:id_to_display", { :controller => "restaurants", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_restaurant_form/:id_to_prefill", { :controller => "restaurants", :action => "prefilled_form", :via => "get" })
  match("/update_restaurant_record/:id_to_modify", { :controller => "restaurants", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
