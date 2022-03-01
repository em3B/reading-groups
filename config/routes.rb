Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # resources :users, only: %i[show] do
  #   resources :reading_groups, only: %i[show] do
  #     resources :questions, only: %i[new create show] do
  #       resources :answers, only: %i[show new create]
  #     end
  #   end
  # end
  resources :users

  resources :reading_groups

  resources :answers
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


# 10.times do
#   User.create!(
#     email: Faker::Internet.email,
#     password: '123456'
#   )
# end

# 10.times do
#   ReadingGroup.create!(
#     user: User.all.sample
#   )
# end
