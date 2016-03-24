Rails.application.routes.draw do
  resources :charges
  devise_for :admins
  devise_for :users,
             :controllers => { :registrations => "users/registrations" }
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
  scope module: 'public' do
    root 'public#homepage'
    get '/sitemap', to: 'public#sitemap'
  end

  scope module: 'cart' do
    post '/cart_add_item', to: 'cart#add_item_to_cart'
    get '/empty_cart', to: 'cart#empty_cart'
    get '/destroy_cart', to: 'cart#destroy'
    get '/cart', to: 'cart#show'
  end

  scope module: 'admin' do
    get '/product/new', to: 'product#new'
    post '/product/create', to: 'product#create'
    get '/product/destroy', to: 'product#destroy'

    get '/category/new', to: 'category#new'
    post '/category/create', to: 'category#create'
    get '/category/destroy', to: 'category#destroy'

    get '/affiliate/new', to: 'affiliate#new'
    post 'affiliate/create', to: 'affiliate#create'
    get '/affiliate/destroy', to: 'affiliate#destroy'

    get '/brand/new', to: 'brand#new'
    post '/brand/create', to: 'brand#create'
    get '/brand/destroy', to: 'brand#destroy'
  end
  
  scope module: 'member' do
    resources :users, only: [:show, :edit, :update, :destroy]
    get '/update_address', to: 'users#update_address'
  end
end
