Rails.application.routes.draw do
  root to: 'visitors#index'
  get "/reports/subjects" => "reports#subjects", as: "report_subjects"

  devise_for :users

  resources :students do
    get :subjects
  end
  resources :teachers do
    get :subjects
  end
  resources :reports
  resources :student_payments

end
