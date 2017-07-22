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
  match '/songs/176-johnny-cash-give-my-love-to-rose', :to => redirect('http://playsongnotes.com/songs/johnny-cash-give-my-love-to-rose/', status: 301)
  match '/songs/163-frozen-jonathan-groff-reindeers-are-better-than-people', :to => redirect('http://playsongnotes.com/songs/frozen-reindeers-are-better-than-people/', status: 301)
  match '/songs/155-neil-diamond-sweet-caroline', :to => redirect('http://playsongnotes.com/songs/neil-diamond-sweet-caroline/', status: 301)
  match '/songs/154-daniel-johnston-true-love-will-find-you-in-the-end', :to => redirect('http://playsongnotes.com/songs/daniel-johnston-true-love-will-find-you-in-the-end/', status: 301)
  match '/songs/153-frozen-demi-lovato-let-it-go', :to => redirect('http://playsongnotes.com/songs/frozen-let-it-go/', status: 301)
  match '/songs/152-lorde-team', :to => redirect('http://playsongnotes.com/songs/lorde-team/', status: 301)
  match '/songs/151-leonard-cohen-hallelujah', :to => redirect('http://playsongnotes.com/songs/leonard-cohen-hallelujah/', status: 301)
  match '/songs/90-sublime-rivers-of-babylon', :to => redirect('http://playsongnotes.com/songs/sublime-rivers-of-babylon/', status: 301)
  match '/songs/150-old-crow-medicine-show-wagon-wheel', :to => redirect('http://playsongnotes.com/songs/old-crow-medicine-show-wagon-wheel/', status: 301)
  match '/songs/67-bob-marley-redemption-song', :to => redirect('http://playsongnotes.com/songs/bob-marley-redemption-song/', status: 301)
  match '/songs/105-of-monsters-and-men-little-talks', :to => redirect('http://playsongnotes.com/songs/of-monsters-and-men-little-talks/', status: 301)
  match '/songs/141-lorde-royals', :to => redirect('http://playsongnotes.com/songs/lorde-royals/', status: 301)
  match '/songs/148-alt-j-breezeblocks', :to => redirect('http://playsongnotes.com/songs/alt-j-breezeblocks/', status: 301)
  match '/songs/143-eddie-vedder-tonight-you-belong-to-me', :to => redirect('http://playsongnotes.com/songs/eddie-vedder-tonight-you-belong-with-me/', status: 301)
  match '/songs/145-dead-mans-bones-paper-ships', :to => redirect('http://playsongnotes.com/songs/dead-mans-bones-paper-ships/', status: 301)
  match '/songs/147-alt-j-matilda', :to => redirect('http://playsongnotes.com/songs/alt-j-matilda/', status: 301)
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
