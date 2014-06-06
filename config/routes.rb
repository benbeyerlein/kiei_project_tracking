Rails.application.routes.draw do
  devise_for :users
  root 'shipments#my_shipments'
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
  get('/tracking_details/track', { :controller => 'tracking_details', :action => 'tracking' })

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

  # Routes for the Courier resource:
  # CREATE
  get('/couriers/new', { :controller => 'couriers', :action => 'new' })
  get('/create_courier', { :controller => 'couriers', :action => 'create' })

  # READ
  get('/couriers', { :controller => 'couriers', :action => 'index' })
  get('/couriers/:id', { :controller => 'couriers', :action => 'show' })

  # UPDATE
  get('/couriers/:id/edit', { :controller => 'couriers', :action => 'edit' })
  get('/update_courier/:id', { :controller => 'couriers', :action => 'update' })

  # DELETE
  get('/delete_courier/:id', { :controller => 'couriers', :action => 'destroy' })
  #------------------------------

  # Routes for the Shipment resource:
  # CREATE
  get('/shipments/new', { :controller => 'shipments', :action => 'new' })
  get('/create_shipment', { :controller => 'shipments', :action => 'create' })

  # READ
  get('/my_shipments', { :controller => 'shipments', :action => 'my_shipments' })

<<<<<<< HEAD
  get('/shipments', { :controller => 'shipments', :action => 'index' })
  get('/shipments/:id', { :controller => 'shipments', :action => 'show' })
=======
  get('/packages/track/:id', { :controller => 'packages', :action => 'track' })

  get('/packages', { :controller => 'packages', :action => 'index' })
  get('/packages/:id', { :controller => 'packages', :action => 'show' })
>>>>>>> 936349b37835c423e311ac0ac2bebce1c4df01cc

  # UPDATE
  get('/shipments/:id/edit', { :controller => 'shipments', :action => 'edit' })
  get('/update_shipment/:id', { :controller => 'shipments', :action => 'update' })

  # DELETE
  get('/delete_shipment/:id', { :controller => 'shipments', :action => 'destroy' })
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
