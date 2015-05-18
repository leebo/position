Rails.application.routes.draw do
  resources :busers
  devise_for :users
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


  namespace :admin do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    resources :home do
      collection do
        get 'single_person'
        post "single_person"
        post "add_geo"
      end
    end
    resources :customers do
      collection do
        get 'index_map'
        get 'new_bulk'
        post "create_bulk"
      end
    end
    resources :sys do
      collection do
        get 'config_location'
        post "complete_config_location"
        get 'config_distance'
        post "complete_config_distance"
        get 'config_measure'
        post "complete_config_measure"
        post "save_config_location"
        get "location_list"
        get 'config_plan'
        post "complete_config_plan"

      end
    end
    resources :monitor do
      collection do
        get 'customers'
        get "events"
      end
    end

  end



  get "/upload/grid/*path" => "gridfs#serve"

  namespace :attachment do
    resources :assets
  end

  namespace :my_test do
    resources :nodes do
      collection do
        post 'tree'
      end
    end
    resources :rooms

  end


  resources :home do
    collection {post 'add_geo'}
  end


end
