Rails.application.routes.draw do
  root 'common#index'
  resources :users
  match 'common/index',to: 'common#index', via: :get
  match 'sign_in',to: 'common#login', via: :get
  match 'sign_up',to: 'common#sign_up', via: :get
  match 'index', to: 'common#my_door', via: :get
  match 'users/(index)',to: 'users#index', via: :get
  match 'data_import/(index)',to: 'data_import#index',via: :get
  match 'data_import/record_data',to: 'data_import#record_data',via: :post
  match 'data_analysis/(index)',to: 'data_analysis#index',via: :get
  match 'data_analysis/:id/show',to: 'data_analysis#show',via: :get
  match 'data_analysis/service_statistics',to: 'data_analysis#service_statistics',via: :get


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
