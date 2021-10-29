Rails.application.routes.draw do
  root to: 'application#applet'

  get '/cookbook', to: 'cookbook#applet'
  
  namespace :cookbook do
    resources :recipes do
      member do
        get :delete
      end
    end
  end
end
