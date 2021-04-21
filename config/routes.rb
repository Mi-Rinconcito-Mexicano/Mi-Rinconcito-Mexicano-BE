Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/menu', to: 'menu#index'
    end
  end
end
