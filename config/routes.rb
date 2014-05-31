Rails.application.routes.draw do
  devise_for :users
  root 'packages#index'
  # Routes for the Address resource:
  # CREATE
  get('/addresses/new', { :controller => 'addresses', :action => 'new' })
  get('/create_address', { :controller => 'addresses', :action => 'create' })

  # READ
  get('/addresses', { :controller => 'addresses', :action => 'index' })
  get('/addresses/:id', { :controller => 'addresses', :action => 'show' })

  # UPDATE
  get('/addresses/:id/edit', { :controller => 'addresses', :action => 'edit' })
  get('/update_address/:id', { :controller => 'addresses', :action => 'update' })

  # DELETE
  get('/delete_address/:id', { :controller => 'addresses', :action => 'destroy' })
  #------------------------------

  # Routes for the Tracking_detail resource:
  # CREATE
  get('/tracking_details/new', { :controller => 'tracking_details', :action => 'new' })
  get('/create_tracking_detail', { :controller => 'tracking_details', :action => 'create' })

  # READ
  get('/tracking_details', { :controller => 'tracking_details', :action => 'index' })
  get('/tracking_details/:id', { :controller => 'tracking_details', :action => 'show' })

  # UPDATE
  get('/tracking_details/:id/edit', { :controller => 'tracking_details', :action => 'edit' })
  get('/update_tracking_detail/:id', { :controller => 'tracking_details', :action => 'update' })

  # DELETE
  get('/delete_tracking_detail/:id', { :controller => 'tracking_details', :action => 'destroy' })
  #------------------------------

  # Routes for the Delivery_type resource:
  # CREATE
  get('/delivery_types/new', { :controller => 'delivery_types', :action => 'new' })
  get('/create_delivery_type', { :controller => 'delivery_types', :action => 'create' })

  # READ
  get('/delivery_types', { :controller => 'delivery_types', :action => 'index' })
  get('/delivery_types/:id', { :controller => 'delivery_types', :action => 'show' })

  # UPDATE
  get('/delivery_types/:id/edit', { :controller => 'delivery_types', :action => 'edit' })
  get('/update_delivery_type/:id', { :controller => 'delivery_types', :action => 'update' })

  # DELETE
  get('/delete_delivery_type/:id', { :controller => 'delivery_types', :action => 'destroy' })
  #------------------------------

  # Routes for the Tracking_number_status resource:
  # CREATE
  get('/tracking_number_statuses/new', { :controller => 'tracking_number_statuses', :action => 'new' })
  get('/create_tracking_number_status', { :controller => 'tracking_number_statuses', :action => 'create' })

  # READ
  get('/tracking_number_statuses', { :controller => 'tracking_number_statuses', :action => 'index' })
  get('/tracking_number_statuses/:id', { :controller => 'tracking_number_statuses', :action => 'show' })

  # UPDATE
  get('/tracking_number_statuses/:id/edit', { :controller => 'tracking_number_statuses', :action => 'edit' })
  get('/update_tracking_number_status/:id', { :controller => 'tracking_number_statuses', :action => 'update' })

  # DELETE
  get('/delete_tracking_number_status/:id', { :controller => 'tracking_number_statuses', :action => 'destroy' })
  #------------------------------

  # Routes for the Carrier resource:
  # CREATE
  get('/carriers/new', { :controller => 'carriers', :action => 'new' })
  get('/create_carrier', { :controller => 'carriers', :action => 'create' })

  # READ
  get('/carriers', { :controller => 'carriers', :action => 'index' })
  get('/carriers/:id', { :controller => 'carriers', :action => 'show' })

  # UPDATE
  get('/carriers/:id/edit', { :controller => 'carriers', :action => 'edit' })
  get('/update_carrier/:id', { :controller => 'carriers', :action => 'update' })

  # DELETE
  get('/delete_carrier/:id', { :controller => 'carriers', :action => 'destroy' })
  #------------------------------

  # Routes for the Package resource:
  # CREATE
  get('/packages/new', { :controller => 'packages', :action => 'new' })
  get('/create_package', { :controller => 'packages', :action => 'create' })

  # READ
  get('/packages', { :controller => 'packages', :action => 'index' })
  get('/packages/:id', { :controller => 'packages', :action => 'show' })

  # UPDATE
  get('/packages/:id/edit', { :controller => 'packages', :action => 'edit' })
  get('/update_package/:id', { :controller => 'packages', :action => 'update' })

  # DELETE
  get('/delete_package/:id', { :controller => 'packages', :action => 'destroy' })
  #------------------------------

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
