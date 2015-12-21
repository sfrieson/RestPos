Rails.application.routes.draw do

  #main views
  root 'restaurant#show'
  resources :host       #was get '/host' => 'restaurant#host'
  resources :server     #was get '/server' => 'restaurant#server'
  resources :kitchen    #was get '/kitchen' => 'restaurant#kitchen'
  scope '/admin' do #allows the URI be prefixed '/admin' without requiring a controller
      resources :users, :dishes
  end


  resources :parties do
      resources :orders
      get '/receipt' => 'parties#receipt'
  end

  get       '/login' => 'restaurant#login'
  get       '/clean' => 'restaurant#clean'
  post      '/sessions' => 'sessions#create'
  delete    '/sessions' => 'sessions#destroy'
  put       '/cook' => 'orders#cook' #duplicated at kitchen#update



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

end
