Rails.application.routes.draw do

  get 'master/show'

  root              'static_pages#home'
  get     'about'      =>  'static_pages#about'
  get     'signup'     =>  'users#new'
  get     'login'      =>  'sessions#new'
  post    'login'      =>  'sessions#create'
  delete  'logout'     =>  'sessions#destroy'
  get     'noaccount'   =>  'static_pages#noaccount'

  resources :users 
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :equipment_type
  resources :brands
  resources :equipment 
  resources :hospitals
  resources :subareas
  resources :areas
  resources :hospitals do
    resources :floors, only: [] do
      get :areas_select, on: :member
    end
    resources :areas, only: [] do
      get :subareas_select, on: :member
    end
    resources :floors do
      resources :areas
    end
    resources :areas
    resources :equipment
    resources :equipment_type
    resources :brands
    resources :areas do
      resources :contacts
      resources :subareas
    end
    resources :contacts
  end
  resources :plans, only: [:index]
  resources :master do
    resources :plans
    resources :accounts
  end
  resources :accounts 
  resources :contacts
  resources :plans do
    resources :hospitals,  only: [ :new, :create ] do
      resources :users,     only: [ :new, :create ] do
        resources :accounts,  only: [ :new, :create ]
      end
    end
  end


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
