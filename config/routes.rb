HenParty::Application.routes.draw do

  root to: "welcome#homepage"

  devise_for :users, :skip => [:registrations]
  
  resources :parties do
    resources :invitations, :only => [:new, :create]
  end

  get 'join/:token' => 'responses#new', :as => 'join_party'
  post 'join/:token' => 'responses#create', :as => 'save_party_response'

  get 'parties/:id/plan' => 'parties#plan', :as => 'plan_party'
  post 'parties/:id/plan/product_search' => 'parties#product_search', :as => 'products_to_plan_party'
  post 'parties/:id/plan/accommodation_search' => 'parties#accommodation_search', :as => 'accommodation_to_plan_party'

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
