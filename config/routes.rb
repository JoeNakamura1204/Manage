Rails.application.routes.draw do
  root 'documents#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :documents, only: %i(index new create show)
end
