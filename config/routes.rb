Rails.application.routes.draw do
  devise_for :users

  resources :students do
    get :subjects
  end
  resources :teachers do
    resources :subjects
  end
  resources :reports

  get "/reports/subjects" => "reports#subjects", as: "report_subjects"
  root to: 'visitors#index'
end
