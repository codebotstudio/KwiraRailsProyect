Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get '/buys/product_record' => 'buys#product_record'
  get '/buys/list_product' => 'buys#list_product'
  resources :buys

  get :send_critical, to: 'products#send_critical', as: :send_critical
  get '/products/inactive' => 'products#inactive'
  get '/products/critical' => 'products#critical'
  get '/products/list' => 'products#list'
  resources :products
  
  get '/devolutions/search' => 'devolutions#search'  
  resources :devolutions

  get '/sales/history' => 'sales#history'
  get '/sales/pending' => 'sales#pending'
  resources :sales

  get '/stores/sales' => 'stores#sales'
  get '/stores/pending' => 'stores#pending'
  get '/stores/history' => 'stores#history'
  get '/stores/buys' => 'stores#buys'
  get '/stores/products' => 'stores#products'
  get '/stores/inactive' => 'stores#inactive'
  get '/stores/critical' => 'stores#critical'
  get '/stores/users' => 'stores#users'
  resources :stores

  get '/users/new' => 'users#new'
  resources :users

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
