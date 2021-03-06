Wedding::Application.routes.draw do
  resources :schedulers

  resources :items

  resources :forum_messages

  resources :forum_threads

  resources :comments

  resources :messages

  resources :products
  resources :profiles

  resources :product_groups

 #
 # authenticated :admin do
  #  if current_user.try(:admin)
   #   root :to => 'admin/dashboard#show'
   # end

  post "products/send_email", :to => "products#send_email"
  post "forum_messages/send_email", :to => "forum_messages#send_email"
  get "welcome/show"
  get "welcome/index"
  get "welcome/search"
  root :to => "welcome#index"
  devise_for :users
  get "product_groups", :to => "product_groups#index"
  get "product_groups/show", :to => "product_groups#show"
  get "products/show", :to => "products#show"
  get "devise/product_groups", :to=> "product_groups#show"
  
  resources :product_groups do
    resources :products
  end
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
  devise_scope :user do
 	 get "sign_in", to: "devise/sessions#new"
   get "sign_out" , to: "devise/sessions#destroy"
  end
  get "profile", to: "profiles#index"
  get "profiles/show", to: "profiles#index"
  get "scheduler", to: "schedulers#index"
  get "schedulers/show", to: "schedulers#index"

  #devise_for :users do
  #get "welcome" => "devise/registrations#new", :as => :new_user_registration
  #get "account_settings" => "devise/registrations#edit"
  #get "sign_out" => "devise/sessions#destroy"
  #get "new_password", :to => "devise/passwords#new"
end
