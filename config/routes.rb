Rails.application.routes.draw do
  # get 'user/v1/article'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users#index"

  namespace :v1 do
    resources :users do
      resources :articles
    end

    resources :articles
  end

end
