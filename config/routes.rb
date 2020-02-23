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
root 'pages#index'
get 'users/:user_id/points', to: 'users#points', as: 'users_points'
post 'users/:user_id/idiomas', to: 'idiomas_users#create', as: 'users_languages'
get 'idiomas/index', to: 'idiomas#index'
delete 'users/:user_id/idiomas/:idioma_id', to: 'idiomas_users#destroy', as: 'delete_user_language'
get 'conversations/:sender_id/show', to: 'conversations#show', as: 'conversations_path'
resources :conversations do
   resources :messages
end

end
