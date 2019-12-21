Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    collection do
      get :show_user, :action => :show_user
      post :authenticate, :action => :authenticate
    end
    # member do
    #
    # end
  end
end
