Rails.application.routes.draw do
  resources :universities, only: [:index]
end
