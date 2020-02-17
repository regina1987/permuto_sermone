Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

      namespace :user do
        root :to => "user#index"
      end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'pages/index'
get 'users/index'
get 'users/:id/show', to: 'users#show', as: 'users_show'
root 'pages#index'
end
