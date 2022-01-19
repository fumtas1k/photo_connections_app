Rails.application.routes.draw do
  root "users#index"
  resources :users
  resources :sessions, only: %i[new create destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
