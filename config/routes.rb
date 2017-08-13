Rails.application.routes.draw do
  devise_for :users
  resources :orids do
    resources :posts
    collection do
      post :bulk_update
    end
  end
  root 'orids#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
