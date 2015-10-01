Oakampd::Application.routes.draw do
  resources :gigs
  resources :users, only: [:new, :show]
  resources :venues
  resources :bands, except: [:index, :show]
  resources :contents, only: [:update]
  resources :features

  root to: "gigs#index"

  devise_for :users, path: "/", path_names: { sign_in: 'login', sign_out: 'logout' }, skip: [:registrations]
  as :user do
    get "users/edit" => "devise/registrations#edit", :as => "edit_user_registration"
    patch "users" => "devise/registrations#update", :as => "update_user_registration"
    delete "users" => "devise/registrations#destroy"
  end

  post "gigs/new_by_csv", to: "gigs#new_by_csv"
  delete "gigs/:id", to: "gigs#destroy", as: "delete_gig"
  delete "venues/:id", to: "venues#destroy", as: "delete_venue"
  get "bandwatch", to: "bands#bandwatch", as: "bandwatch"
  delete "bands/:id", to: "bands#destroy", as: "delete_band"
  get "contents/edit", to: "contents#edit", as: "edit_content"
  delete "features/:id", to: "features#destroy", as: "delete_feature"

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
