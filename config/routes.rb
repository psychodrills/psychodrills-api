Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do
        collection do
          get :show_user, :action => :show_user
          post :login, :action => :login
        end
        # member do
        #
        # end
      end

      resources :action_tags do
        collection do

        end
        # member do
        #
        # end
      end

      resources :school_groups do
        collection do

        end
        # member do
        #
        # end
      end
    end
  end
end