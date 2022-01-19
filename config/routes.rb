Rails.application.routes.draw do
  root "users#index"
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
