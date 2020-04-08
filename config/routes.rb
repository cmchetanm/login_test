Rails.application.routes.draw do
  # get 'homes/index'
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

	devise_scope :user do
	   get 'users/password', to: 'users/sessions#password'
	end
end
