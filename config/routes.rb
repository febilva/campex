Rails.application.routes.draw do
  resources :examinations
  resources :paper_types
  resources :term_structure_entries
  resources :term_structures
  resources :course_types
  resources :departments, shallow: true do
    resources :courses do
      member do
        get 'syllabuses'
        get 'terms'
        get 'batches'
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
