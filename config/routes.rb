Rails.application.routes.draw do
  resources :glucose_measurements, path: 'glucose'
  resources :medication_events, path: 'meds'
  resources :carbohydrate_intakes, path: 'carbs'
  resources :physical_exercises, path: 'exercise' 

  root 'welcome#index'
end
