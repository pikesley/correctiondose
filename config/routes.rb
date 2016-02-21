Rails.application.routes.draw do
  resources :glucose_measurements, path: 'glucose'
  resources :medication_events, path: 'meds'
  resources :carbohydrate_intakes, path: 'carbs'
  resources :physical_exercises, path: 'exercise'
  resources :glycated_haemoglobins, path: 'hba1c'
  resources :blood_pressures, path: 'bp'
  resources :api
  resources :charts

  resources :longterm, path: 'long-term'

  root 'welcome#index'
end
