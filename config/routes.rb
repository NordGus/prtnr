Rails.application.routes.draw do
  root to: 'application#applet'

  get :cookbook, to: 'cookbook#applet'
  get :diet, to: 'diet#applet'

  namespace :cookbook do
    resources :ingredients, only: [] do
      collection do
        post :search
      end
    end

    resources :recipes do
      resources :recipe_ingredients, only: %i[index new create edit update destroy] do
        member do
          get :delete
        end
      end

      member do
        get :delete
      end
    end
  end
end
