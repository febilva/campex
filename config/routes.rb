Rails.application.routes.draw do
  resources :course_types
  resources :departments, shallow: true do
    resources :courses
  end
  
  devise_for :users, path: ""
  devise_scope :user do
    unauthenticated { root to: 'devise/sessions#new'}
    authenticated { root to: 'dashboard#index', 
      as: :dashboard}
  end
end
