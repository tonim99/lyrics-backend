Rails.application.routes.draw do
  resources :songs
  resources :setlists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "songs/search/artist/:search", to: "songs#search_by_artist"

  get"songs/search/track/:search", to: "songs#search_by_track"
  
  get"songs/search/lyrics/:search", to: "songs#search_lyrics"
end
