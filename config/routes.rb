Songnotes::Application.routes.draw do

  devise_for :admin_users

  root to: 'pages#home'

  # get "/songs/149-johnny-cash-i-walk-the-line" => redirect("http://playsongnotes.com/songs/johnny-cash-i-walk-the-line/")
  # match "/songs/149-johnny-cash-i-walk-the-line" => redirect("http://example.com/blog"), :as => :blog
  # get '/songs/149-johnny-cash-i-walk-the-line', to: redirect('http://playsongnotes.com/songs/johnny-cash-i-walk-the-line/', status: 301)
  # match '____SONGNOTESCC_ORIGIN____', :to => redirect('____PLAYSONGNOTES_DESTINATION____', status: 301)
  match '/songs/149-johnny-cash-i-walk-the-line', :to => redirect('http://playsongnotes.com/songs/johnny-cash-i-walk-the-line/', status: 301)
  match '/songs/65-bryan-adams-summer-of-69', :to => redirect('http://playsongnotes.com/songs/bryan-adams-summer-of-69/', status: 301)
  match '/songs/70-neil-young-out-on-the-weekend', :to => redirect('http://playsongnotes.com/songs/neil-young-out-on-the-weekend/', status: 301)
  match '/songs/56-the-eagles-hotel-california', :to => redirect('http://playsongnotes.com/songs/eagles-hotel-california/', status: 301)
  match '/songs/126-ricky-nelson-lonesome-town', :to => redirect('http://playsongnotes.com/songs/ricky-nelson-lonesome-town/', status: 301)
  match '/songs/133-lynyrd-skynyrd-sweet-home-alabama', :to => redirect('http://playsongnotes.com/songs/lynyrd-skynyrd-sweet-home-alabama/', status: 301)
  match '/songs/108-johnny-cash-folsom-prison-blues', :to => redirect('http://playsongnotes.com/songs/johnny-cash-folsom-prison-blues/', status: 301)
  # match '____SONGNOTESCC_ORIGIN____', :to => redirect('____PLAYSONGNOTES_DESTINATION____', status: 301)

  namespace :admin do
    match '/' => "songs#index"
    resources :songs, :except => :show
    resources :artists, :except => :show
    resources :albums, :except => :show
  end

  match 'home' => 'pages#home', :as => 'home'
  match 'api' => 'pages#api', :as => 'api'

  resources :songs, :only => [:index, :show]
  resources :artists, :only => [:index, :show]
  resources :albums, :only => [:index, :show]





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
