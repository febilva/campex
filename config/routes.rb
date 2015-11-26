Rails.application.routes.draw do
  resources :periods
  resources :class_timings
  resources :districts
  resources :states
  resources :exam_registrations do
    member do
      get 'download_hallticket'
    end
  end
  resources :students
  resources :roles do
    member do
      get 'assign_permission'
      get 'assign_users'
    end
  end
  resources :examinations do
    member do
      get 'nominal_roll'
    end
  end
  resources :paper_types
  resources :term_structure_entries
  resources :term_structures
  resources :course_types
  resources :departments, shallow: true do
    resources :courses do
      member do
        get 'syllabus_list'
        get 'term_list'
        get 'batch_list'
      end

      resources :syllabuses do
        resources :papers
      end
      resources :batches do
        resources :term_dates
      end
    end
  end
  
  devise_for :users, path: ""
  devise_scope :user do
    unauthenticated { root to: 'devise/sessions#new'}
    authenticated { root to: 'dashboard#index', 
      as: :dashboard}
  end
end
