Rails.application.routes.draw do
  namespace :v1 do
    get  "/admins_login" , to: "admins#login"
    post "/admin_create" , to: "admins#create"
    get  "/users"        , to: "users#index"
    post "/users"        , to: "users#create"
    get  "/delete_users" , to: "users#destroy"
  end
end
