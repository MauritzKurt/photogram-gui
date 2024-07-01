Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  post("/add_user", { :controller => "users", :action => "create" })
  post("/update_user/:path_username", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_photoid", { :controller => "photos", :action => "show" })
  post("/update_photo/:modify_id", { :controller => "photos", :action => "update" })
  get("/insert_photo", { :controller => "photos", :action => "create" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete" })

  post("/add_comment", { :controller => "photos", :action => "create_comment" })
end
