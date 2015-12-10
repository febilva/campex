Rails.application.routes.draw do
  resources :student_attendance_registers
  resources :paper_assignments
  resources :teachers do
    member do
      get 'assign_papers'
      get '/batches/:batch_id/period_list' => 'teachers#period_list'
    end
  end
  resources :designations
  resources :timetables do
    member do
      match 'allot_periods', via: [:get, :post]
    end
  end
  resources :class_timings, shallow: true do
    resources :periods
  end
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
        resources :papers do
          member do
            get 'teacher_list'
          end
        end
      end
      resources :batches do
        member do
          get 'paper_list'
          get 'papers'
          get 'papers/:paper_id' => 'papers#participants_list', as: :paper
        end
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
