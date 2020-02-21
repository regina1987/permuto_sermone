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
post 'likes/:user_id', to: 'likes#create', as: 'likes'
get 'users/:user_id/points', to: 'users#points', as: 'users_points'
post 'users/:user_id/languages', to: 'users_languages#create', as: 'users_languages'
get 'users/languages', to: 'users#languages'
delete 'users/:user_id/languages/:language_id', to: 'users_languages#destroy', as: 'delete_user_language'
root 'pages#index'
end
