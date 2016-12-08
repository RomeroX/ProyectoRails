Rails.application.routes.draw do

  get 'list/show'

  root 'lists#new'

  resources :lists

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
