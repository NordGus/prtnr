Rails.application.routes.draw do
  root to: 'application#applet'

  namespace :diet do
    resources :recipes, only: [] do
      post :search, on: :collection
    end

    resources :menu, only: :index do
      get :calendar, on: :member

      resources :menu_items, only: %i[index new create destroy] do
        get :delete, on: :member
        get :count, on: :collection
      end
    end
  end

  namespace :cookbook do
    resources :ingredients, only: [] do
      post :search, on: :collection
    end

    resources :recipes do
      get :delete, on: :member

      resources :recipe_ingredients, only: %i[index new create edit update destroy] do
        get :delete, on: :member
      end
    end
  end
end
