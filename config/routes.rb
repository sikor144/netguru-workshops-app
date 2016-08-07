Rails.application.routes.draw do
  root to: 'visitors#index'
  get "/reports/subjects" => "reports#subjects", as: "report_subjects"

  devise_for :users

  resources :students do
    get :subjects
  end
  resources :teachers do
    resources :subjects
  end
  resources :reports

end
