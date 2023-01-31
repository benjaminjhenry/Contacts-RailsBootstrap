Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "main#index"
  get "about", to: "about#index"

  get "sign_up", to: "register#new"
  post "sign_up", to: "register#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :password_edit
  patch "password", to: "passwords#update"
  
  get "contact", to: "contacts#index"

  get "contact_new", to: "contacts#new"
  post "contact_new", to: "contacts#create"

  get "contact_edit", to: "contacts#edit", as: :contact_edit
  patch "contact_edit", to: "contacts#update", as: :contact_update
  #post "contact_edit", to: "contacts#update", as: :contact_update
  get "contact_delete", to: "contacts#delete"
  post "contact_export", to: "contacts#export"



  delete "logout", to: "sessions#destroy"

end
