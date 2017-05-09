Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :urls, only: [:index] do
        post :parse, on: :collection
      end
    end
  end
end
