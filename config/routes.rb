Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  get 'erros/not_found'

  get 'erros/internal_server_error'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  get 'design', to: 'design#index'

  get 'solutions', to: 'solutions#index'

  get 'people', to: 'people#index'

  # get 'resources', to: 'resources#index'
  resources :resources, only: [:index, :show] do
    collection do
      get 'blarg'
    end
  end

  get 'careers', to: 'careers#index'

  get 'technology', to: 'technology#index'

  get 'animations', to: 'animations#index'

  get 'error', to: 'error#index'

  get 'contact', to: 'contact#index'

  get 'timeline', to: 'timeline_component#index'

  match "/404", :to => "errors#not_found", :via => :all

  match "/500", :to => "errors#internal_server_error", :via => :all

  # Redirect all else to page not found
  match '*path' => redirect('/404'), via: :get

  root 'home#index'

  resources :records
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
