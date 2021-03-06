Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :events
  

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'pages/index'
get 'pages/calendar'

get 'users/index'
get 'users/:id/show', to: 'users#show', as: 'users_show'
get 'users/:user_id/points', to: 'users#points', as: 'users_points'
post 'users/:user_id/idiomas', to: 'idiomas_users#create', as: 'users_languages'

post 'likes/:user_id', to: 'likes#create', as: 'likes'

get 'idiomas/index', to: 'idiomas#index'
delete 'users/:user_id/idiomas/:idioma_id', to: 'idiomas_users#destroy', as: 'delete_user_language'

get 'conversations/:sender_id/show', to: 'conversations#show', as: 'conversations_path'

resources :conversations do
   resources :messages
end

get 'users/staff', to: 'users#staff', as: 'staffs'
resources :customers

get 'locations', to: 'locations#index'

root "pages#index"

end
