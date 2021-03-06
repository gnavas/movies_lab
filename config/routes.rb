Rails.application.routes.draw do

  get '/login', to: 'access#login', as: "login"
  get '/signup', to: 'access#signup', as: "signup"
  post '/signup', to: 'access#create', as: "users"
  post '/login', to: 'access#attempt_login', as: "attempt_login"
  delete '/logout', to: 'access#logout', as: 'logout'

  root 'movies#index'
  resources :movies 
  resources :actors 
  resources :access

  post '/movies/add_comment', to: 'comments#create_movie_comment', as: 'create_movie_comment'
  post '/actors/add_comment', to: 'comments#create_actor_comment', as: 'create_actor_comment'
  

  post '/actor_movies/:id', to: 'actor_movies#create', as: 'create_actor'
  post '/movie_actors/:id', to: 'actor_movies#update', as: 'create_movie'
  delete '/movie_actors/:id/delete/:movie_id', to:'actor_movies#destroy', as: 'destroy_movie'
  delete '/actor_movies/:id/delete/:actor_id', to:'actor_movies#delete', as: 'destroy_actor'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
