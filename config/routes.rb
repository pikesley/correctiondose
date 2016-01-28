Rails.application.routes.draw do
  resources :glucose_measurements, path: 'glucose'
  resources :medication_events, path: 'meds' 

  root 'welcome#index'
end
