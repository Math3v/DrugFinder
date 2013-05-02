DrugFinderDb::Application.routes.draw do
  resources :statistics
  resources :users
  resources :suppliers  do
     get :find, on: :collection
  end
  resources :holders do
    get :find, on: :collection
  end
  resources :producers  do
    get :find, on: :collection
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :drugs do
    get :search, on: :collection
    get :wide_search, on: :collection
    get :body_clicked_search, on: :collection
  end

  root :to => 'drugs#find_specific'

  #match 'drugs/:name/find'     =>  'drugs#find',                      :as => 'drugs_find'
  match 'holders/:name/find'   =>  'holders#find',                    :as => 'holders_find'
  match 'holders/:id/drugs'    =>  'holders#show_all',                :as => 'holders_show_all_drugs'
  match 'suppliers/:name/find' =>  'suppliers#find',                  :as => 'suppliers_find'
  match 'suppliers/:id/drugs'  =>  'suppliers#show_all',              :as => 'suppliers_show_all_drugs'
  match 'producers/:name/find' =>  'producers#find',                  :as => 'producers_find'
  match 'producers/:id/drugs'  =>  'producers#show_all',              :as => 'producers_show_all_drugs'
  match '/signin',             to: 'sessions#new'
  match '/signout',            to: 'sessions#destroy',                via: :delete
  match '/about',              to: 'static_pages#about'
  match '/contact',            to: 'static_pages#contact'
  match '/find_specific',      to: 'drugs#find_specific'
  match '/stats',              to: 'statistics#stats'
  match '/find_producers',     to: 'producers#find_producers'
  match '/find_suppliers',     to: 'suppliers#find_suppliers'
  match '/find_holders',       to: 'holders#find_holders'
  match '/human_body',         to: 'static_pages#body'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
