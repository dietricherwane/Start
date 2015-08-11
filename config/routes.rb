Rails.application.routes.draw do
  root 'home#index'

  get 'competences' => 'home#skills', as: :skills
  get 'a-propos' => 'home#about_us', as: :about_us
  get 'nos-projets' => 'home#portfolio', as: :portfolio


  get 'administrator/subject' => 'subjects#new', as: :subject
  post 'administrator/subject/create' => 'subjects#create', as: :create_subject
  get 'administrator/subject/create' => 'subjects#new'
  get 'administrator/subjects' => 'subjects#show', as: :subjects
  get 'administrator/subject/edit/:subject_id' => 'subjects#edit', as: :edit_subject
  post 'administrator/subject/update/:subject_id' => 'subjects#update', as: :update_subject
  get 'administrator/subject/update/:subject_id' => 'subjects#edit'
  get 'administrator/subject/enable/:subject_id' => 'subjects#enable', as: :enable_subject
  get 'administrator/subject/disable/:subject_id' => 'subjects#disable', as: :disable_subject

  get 'administrator/budget' => 'budgets#new', as: :budget
  post 'administrator/budget/create' => 'budgets#create', as: :create_budget
  get 'administrator/budget/create' => 'budgets#new'
  get 'administrator/budgets' => 'budgets#show', as: :budgets
  get 'administrator/budget/edit/:budget_id' => 'budgets#edit', as: :edit_budget
  post 'administrator/budget/update/:budget_id' => 'budgets#update', as: :update_budget
  get 'administrator/budget/update/:budget_id' => 'budgets#edit'
  get 'administrator/budget/enable/:budget_id' => 'budgets#enable', as: :enable_budget
  get 'administrator/budget/disable/:budget_id' => 'budgets#disable', as: :disable_budget

  get 'administrator/project' => 'projects#new', as: :project
  post 'administrator/project/create' => 'projects#create', as: :create_project
  get 'administrator/project/create' => 'projects#new'
  get 'administrator/projects' => 'projects#show', as: :projects

  get 'administrator/completed_project' => 'completed_projects#new', as: :completed_project
  post 'administrator/completed_project/create' => 'completed_projects#create', as: :create_completed_project
  get 'administrator/completed_project/create' => 'completed_projects#new'
  get 'administrator/completed_projects' => 'completed_projects#show', as: :completed_projects
  get "portfolio/:completed_project_id/details" => "completed_projects#details", as: :completed_project_details

  get 'administrator/completed_project_category' => 'completed_project_categories#new', as: :completed_project_category
  post 'administrator/completed_project_category/create' => 'completed_project_categories#create', as: :create_completed_project_category
  get 'administrator/completed_project_category/create' => 'completed_project_categories#new'
  get 'administrator/completed_project_categories' => 'completed_project_categories#show', as: :completed_project_categories
  get 'administrator/completed_project_category/edit/:completed_project_category_id' => 'completed_project_categories#edit', as: :edit_completed_project_category
  post 'administrator/completed_project_category/update/:completed_project_category_id' => 'completed_project_categories#update', as: :update_completed_project_category
  get 'administrator/completed_project_category/update/:completed_project_category_id' => 'completed_project_categories#edit'
  get 'administrator/completed_project_category/enable/:completed_project_category_id' => 'completed_project_categories#enable', as: :enable_completed_project_category
  get 'administrator/completed_project_category/disable/:completed_project_category_id' => 'completed_project_categories#disable', as: :disable_completed_project_category



  get 'contact' => 'contacts#new', as: :contact
  post 'contact/create' => 'contacts#create', as: :create_contact
  get 'contact/create' => 'contacts#new'
  get 'administrator/contacts' => 'contacts#show', as: :contacts

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
  get '*rogue_url', :to => 'errors#routing'
  post '*rogue_url', :to => 'errors#routing'
end
