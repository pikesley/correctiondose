Rails.application.routes.draw do
  resources :glucose_measurements, path: 'glucose'
  resources :medication_events, path: 'meds'
  resources :carbohydrate_intakes, path: 'carbs' 

  root 'welcome#index'
end
