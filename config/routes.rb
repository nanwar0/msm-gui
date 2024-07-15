Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/new_director", { :controller => "directors", :action => "add" })
  post("/update_director/:path_id", { :controller => "directors", :action => "update" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/new_movie",{ :controller => "movies", :action => "add" } )
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/new_actor", { :controller => "actors", :action => "add" })
  post("/update_actor/:path_id", { :controller => "actors", :action => "update" })
  post("/delete_actor", { :controller => "actors", :action => "delete" })
end
