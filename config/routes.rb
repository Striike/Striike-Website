Rails.application.routes.draw do
  get 'category/index'

  get 'category/show'

  get 'sites/index'

  get 'formulaire/:id' => 'sites#commande'

  post 'formulaire/add' => 'sites#create'

  get 'estimations/index'

  get 'portail' =>'pages#portail'

  get 'index' => 'pages#index'

  get ':name' => 'category#show'

  get 'p5r' => 'pages#p5r'

  root 'pages#index'

  get 'admin/add' => 'add_cate#index'

  post 'admin/add_site' => 'add_cate#create_sites'
  post 'admin/add_cate' => 'add_cate#create_cat'

  get 'books/:id' => 'books#show'

  get 'Pages/:id' => 'sites#pages'

  post 'books' => 'books#create'


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
