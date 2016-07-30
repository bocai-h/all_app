Rails.application.routes.draw do
  get 'channels/index'

  root 'common#index'

  get 'pages/error_404'
  resources :users
  get '/sign_in',to: 'common#login'
  get '/sign_up',to: 'common#sign_up'
  get '/email_validate',to: 'users#validate_email_avaiable'

  match 'sessions/destroy',to: 'sessions#destroy',via: :delete
  resources :sessions, only: ["new","create"]

  get '/go_chat_room',to: 'welcome_chat_rooms#index'
  post '/chat_room_authenticate',to: 'welcome_chat_rooms#chat_room_authenticate'
  get '/chat_room',to: 'welcome_chat_rooms#chat_room'
  get '/leave_chat_room',to: 'welcome_chat_rooms#leave_chat_room'

  resource :channel,:only => [:index,:new,:create,:destroy]


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
  # 在生产环境中拦截所有的非正常路由访问
  # if Rails.env.production?
  #   match "*path",to: "pages#error_404",via: :all
  # end
  match "*path",to: "pages#error_404",via: :all
end
