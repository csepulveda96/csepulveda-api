Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :v1 do
    namespace :init do
      resources :init, only: [] do
        collection do
          get :index
        end
      end
    end

    namespace :texts do
      resources :translations, only: [] do
        collection do
          get :index
        end
      end
    end
  end

end
