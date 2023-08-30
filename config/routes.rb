Rails.application.routes.draw do
  post 'notify/notify', as: :notifier
  post 'notify/simple', as: :simple

  jsonapi_resources :messages, only: :create
end
