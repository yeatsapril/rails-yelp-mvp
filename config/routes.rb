Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurant do
    collection do
      # route that applies to a collection of restaurants
      # get 'top'
    end

    member do
      # route that applies to a single restaurant
      # get 'address'
    end

    resources :reviews, only: %i[index new create]
  end
  resources :reviews, except: %i[index new create destroy]
end
