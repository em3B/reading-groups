Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # student routes
  resources :students do
    resources :reading_groups, only: %i[index show] do
      resources :daily_readings, through: :texts, only: %i[show] do
        resources :questions, only: %i[show] do
          resources :answers, only: %i[show new create update]
        end
      end
    end
  end

  # teacher routes
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
