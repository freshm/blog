Blog::Application.routes.draw do
  resources :users do
    resources :saved_posts, only: [:index]
    resources :friendships, only: [:index]
  end
  resources :blog_posts do
    resources :comments
  end
  
  resources :saved_posts, only: [:create, :destroy]
  
  resources :sessions, only: [:new, :create, :destroy]
  
  root :to => 'static_pages#home'
  match '/login',  to: 'sessions#new'
  match '/logout', to: 'sessions#destroy'
  match '/signup', to: 'users#new'
  match '/save/:blogpost_id', to: 'saved_posts#create', as: 'fav_blogpost'
  match '/delete/:blogpost_id', to: 'saved_posts#destroy', as: 'unfav_blogpost'
  match '/add_friend/:user_id', to: 'friendships#create', as: 'add_friend'
  match '/rm_friend/:user_id', to: 'friendships#destroy', as: 'remove_friend'
  match '/users/:user_id/confirm/:confirmation_code', to: 'users#confirmation', as: 'confirmation'
  match '/confirm_friendship/:friendship_id/:confirmation_code', to: 'friendships#confirmation', as: 'f_confirmation'

  ##match '/unsavepost', to: 'saved_pages#destroy'
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
