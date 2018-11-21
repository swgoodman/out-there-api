Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :boards
      resources :users do
        resources :groups, :only => [:index, :create, :show, :update, :destroy]
      end
    end
  end


end
