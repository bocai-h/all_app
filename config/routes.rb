Rails.application.routes.draw do
  root 'common#index'

  get 'pages/error_404'
  resources :users
  get '/sign_in',to: 'common#login'
  get '/sign_up',to: 'common#sign_up'
  get '/email_validate',to: 'users#validate_email_avaiable'

  delete 'session',to: 'sessions#destroy'
  resources :sessions, only: ["new","create"]

  get '/go_chat_room',to: 'welcome_chat_rooms#index'
  post '/chat_room_authenticate',to: 'welcome_chat_rooms#chat_room_authenticate'
  get '/chat_room',to: 'welcome_chat_rooms#chat_room'
  get '/leave_chat_room',to: 'welcome_chat_rooms#leave_chat_room'

  get 'messages/:id',to: 'chat_messages#index', as: "messages_index"

  resource :channel,:only => [:index,:new,:create,:destroy] do
    resource :chat_message,:only => :create
  end

  mount ActionCable.server => '/cable'
  match "*path",to: "pages#error_404",via: :all
end
