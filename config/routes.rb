Rails.application.routes.draw do
  root "pictures#index"
  resources :favorites, only: %i[create destroy]
  resources :users do
    member do
      get :favorites
    end
  end
  resources :sessions, only: %i[new create destroy]
  resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
