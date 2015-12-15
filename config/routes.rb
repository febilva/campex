Rails.application.routes.draw do
  resources :authorization_requests
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
    member do
      get 'new_common_paper'
      post 'create_common_paper'
    end
    resources :courses do
      member do
        get 'syllabus_list'
        get 'term_list'
        get 'batch_list'
      end

      resources :syllabuses do
        resources :papers do
          collection do
            get 'borrow_list'
            post 'borrow'
          end
          member do
            get 'teacher_list'
          end
        end
      end
      resources :batches do
        resources :internal_marks
        member do
          get 'students_list'
          get 'paper_list'
          get 'papers'
          get 'papers/:paper_id' => 'papers#participants_list', as: :paper
          post 'papers/:paper_id/add_participant' => 'papers#add_participant'
          delete 'papers/:paper_id/remove_participant' => 'papers#remove_participant'
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
