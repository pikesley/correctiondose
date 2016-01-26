Rails.application.routes.draw do
  resources :glucose_measurement, path: 'glucose' 

  root 'welcome#index'
end
