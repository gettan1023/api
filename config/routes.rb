Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :jugyos, only: [:create]
      resources :universities, only: [:index]
    end
  end
end
