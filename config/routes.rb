Rails.application.routes.draw do
  get 'notification/index'

  get 'notification/create'

  get '/admin/pro' => 'add_cate#pro'

  get '/admin/commande/edit/:id' => 'add_cate#edit_comm'
  patch '/admin/commande/check_out/:id' => 'add_cate#check_out'
  patch '/admin/commande/update/:id' => 'add_cate#update_comm'
  delete '/admin/commande/delete/:id' => 'add_cate#delete_com'

  get  'admin' => 'user#login'
  get '/admin/show_commande' => 'add_cate#show_commande'
  post '/admin/check' => 'user#check'
  get '/admin/delog' => 'user#delog'
  post '/commande/add' => 'sites#create'
  post '/commande/payement/validate' => 'sites#validate'
  get '/commande/payement' => 'sites#payement'
  get '/send/mail/:id_client' => 'user#create'

  get 'user/login'

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
  delete 'admin/delete_cate' => 'add_cate#delete_item'
  delete 'admin/delete_site' => 'add_cate#delete_site'
  post 'admin/edit_site' => 'add_cate#edit_site'
  post 'admin/edit_cate' => 'add_cate#edit_cate'
  patch '/admin/update_site' => 'add_cate#update_site'
  patch '/admin/update_cate' => 'add_cate#update_cate'

  get 'books/:id' => 'books#show'

  get 'Pages/:id' => 'sites#estimations'

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
