Rails.application.routes.draw do
  devise_for :users

  resources :students do
    get :subjects
  end
  resources :teachers
  resources :reports

  get "/reports/subjects" => "reports#subject", as: "report_subjects"
  root to: 'visitors#index'
end
