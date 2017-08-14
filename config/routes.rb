Rails.application.routes.draw do

  devise_for :users
  resources :orids do
    resources :posts
  end

  namespace :account do
    resources :orids do
      collection do
        post :bulk_update
      end
    end
    resources :posts
  end
  root 'feedbacks#index'
  resources :feedbacks do
    member do
      post "like" => "feedbacks#like"
      post "unlike" => "feedbacks#unlike"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
