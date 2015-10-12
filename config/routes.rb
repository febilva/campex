Rails.application.routes.draw do
  resources :term_structure_entries
  resources :term_structures
  resources :course_types
  resources :departments, shallow: true do
    resources :courses do
      resources :batches
    end
  end
  
  devise_for :users, path: ""
  devise_scope :user do
    unauthenticated { root to: 'devise/sessions#new'}
    authenticated { root to: 'dashboard#index', 
      as: :dashboard}
  end
end
