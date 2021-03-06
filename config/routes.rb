Rails.application.routes.draw do
  get 'browse', to: 'posts#browse', as: :browse_posts
  post ':username/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
  get 'notifications', to: 'notifications#index'
  root 'posts#index'
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :posts
  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end
  # Using a symbol (:username) to enable dynamic parameter, since usernames change
  # HTTP verb, URI pattern, controller#action, prefix 
  get ':username', to: 'profiles#show', as: :profile
  get ':username/edit', to: 'profiles#edit', as: :edit_profile
  patch ':username/edit', to: 'profiles#update', as: :update_profile
end

