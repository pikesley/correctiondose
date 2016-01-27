Rails.application.routes.draw do
  resources :glucose_measurements, path: 'glucose' 

  root 'welcome#index'
end
