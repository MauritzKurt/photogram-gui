Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_photoid", { :controller => "photos", :action => "show" })
  get("/insert_photo", { :controller => "photos", :action => "create" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete" })
end
