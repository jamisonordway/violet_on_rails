Rails.application.routes.draw do
  devise_for :users

  root to: 'guests#welcome', as: 'homepage'

  get '/leaderboards/public', to: 'leaderboards#public', as: 'leaderboard'
  get '/leaderboards/friends', to: 'leaderboards#friends', as: 'friends_leaderboard'

  get '/dashboard', to: 'users/users#dashboard', as: 'dashboard'

  scope module: :users do
    resources :freewrites, except: [:edit, :update]
    resources :lyrics, only: [:index, :show], controller: 'lyric_lines'
    resources :songs
    resources :sections do
      resources :chord_progressions, only: [:new, :create]
    end
    resources :chord_progressions, only: [:edit, :update, :destroy]
  end
end
