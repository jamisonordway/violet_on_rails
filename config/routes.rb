Rails.application.routes.draw do
  devise_for :users

  root to: 'guests#welcome', as: 'homepage'

  get '/leaderboards/public', to: 'leaderboards#public', as: 'leaderboard'
  get '/leaderboards/friends', to: 'leaderboards#friends', as: 'friends_leaderboard'

  get '/dashboard', to: 'users/users#dashboard', as: 'dashboard'

  scope module: :users do
    resources :freewrites, except: [:edit, :patch]
    resources :songs
    resources :sections
    resources :chord_progressions
  end
end
