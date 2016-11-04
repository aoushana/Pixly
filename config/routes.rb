Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/upload', to: 'images#new'
  post '/upload', to: 'images#create'

  resources :users
  resources :images do
    member do
      put "like"
      put "dislike"
    end
  end

  resources :votes


  root 'images#index'

  # /users/:id
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
# HTTP verbs
# GET -> Visiting a URL with intent of reading
# PUT -> Submitting data to a URL with intent of updating
# POST -> Submitting data to a URL with intent of creating
# DELETE -> Submitting data to a URL with intend of deleting