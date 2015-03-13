Rails.application.routes.draw do
    
  
  root to: "sessions#new"

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  delete 'logout' => 'sessions#destroy'
  get 'info_forms' => 'info_forms#index'
  get 'assign_single_shift/:id', to: 'shifts#assign_single_shift', as: :assign_single_shift
  put 'single_shift_assign/:id', to: 'shifts#single_shift_assign', as: :single_shift_assign
  get 'team_lead_ok/:job_id', to: 'timesheet_days#team_lead_ok', as: :team_lead_ok
  put 'ok_by_team_lead', to: 'timesheet_days#ok_by_team_lead', as: :ok_by_team_lead
  get 'weekly_timesheet/:agent_id', to: 'timesheet_weeks#weekly_timesheet', as: :weekly_timesheet
  put 'admin_approve', to: 'timesheet_weeks#admin_approve', as: :admin_approve
 

  
  resources :users

  resources :sessions, only: [:new, :create, :index, :destroy]

  resources :agents

  resources :jhooks, only: [:new, :create ]

  resources :jobs do
    member do
      get 'job_calendar', to: 'jobs#job_calendar', as: :job_calendar
      end
    resources :jhooks do      
      collection do
        get :assign_team_lead
        put :team_lead_assignment
        get :available_agents 
        put :assign
        get :shift_calendar     
        put :shift_selections
        get :assign_manual
        put :manual_assignment
        get :wage_setter
        get :wage_setter_partial
        put :set_wages
      end             
    end 
    resources :shifts do
      collection do
        get :availability_calendar
        put :shift_level_assign        
      end
    end

  end 

  resources :shifts, only: [:index ]

  resources :shooks do
    resources :timesheets, only: [:new, :create]    
  end

  resources :timesheets, only: [:index, :destroy] 

  resources :timesheet_days, only: [:index]

  resources :timesheet_weeks, only: [:index]

  resources :reported_agent, only: [:index]

  resources :completed_agent, only: [:index]



  
  

  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
