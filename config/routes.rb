Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'user_auths#authenticate'
  get 'show_user', to: 'user_auths#show_user'
end
