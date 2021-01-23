Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :items do
        resources :searches
      end
    end
  end
  namespace :api do 
    namespace :v1 do 

      namespace :items do
        get '/:id/merchants', to: 'merchants#show'
      end
      resources :items

      namespace :merchants do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
      end

      resources :merchants do 
        resources :items, only: :index
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
