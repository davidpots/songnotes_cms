Songnotes::Application.routes.draw do

  resources :albums

  resources :artists

  root to: 'pages#home'

  match 'adminius' => 'songs#admin', :as => 'admin'

  match 'directory' => 'songs#index', :as => 'song_directory'

  match 'home' => 'pages#home', :as => 'home'
  match 'about' => 'pages#about', :as => 'about'

  resources :songs

  # Sandbox
  match 'sandbox' => 'sandbox#index', :as => 'sandbox'
  match 'sandbox/grid' => 'sandbox#grid', :as => 'sandbox_grid'
  match 'sandbox/basic' => 'sandbox#basic', :as => 'sandbox_basic'
  match 'sandbox/backgrounds' => 'sandbox#backgrounds', :as => 'sandbox_backgrounds'
  match 'sandbox/tiles' => 'sandbox#tiles', :as => 'sandbox_tiles'
  match 'sandbox/tiles_2' => 'sandbox#tiles_2', :as => 'sandbox_tiles_2'
  match 'sandbox/song_1' => 'sandbox#song_1', :as => 'sandbox_song_1'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
