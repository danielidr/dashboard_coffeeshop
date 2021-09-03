Rails.application.routes.draw do
  resources :sales
  
  root 'sales#index'
end
