Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :olympians, only: [:index]
      get 'olympian_stats', to: 'olympians#stats'
      resources :events, only: [:index] do
        get '/medalists', to: 'events#medalists'
      end
    end
  end

end
