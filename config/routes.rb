Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :jugyos, only: [:index, :create]
      resources :universities, only: [:index]
      resources :users, only: [:create]
      get 'rooms/:uuid' => 'rooms#show'
    end
  end
end
