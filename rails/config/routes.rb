Datoscientificos::Application.routes.draw do
  resources :event_registrations

  # Pages
  root 'pages#index'
  get 'presentacion', to: 'pages#presentacion'
  get 'participacion', to: 'pages#participacion'
  get 'buenas_practicas', to: 'pages#buenas_practicas'
  get 'beneficios', to: 'pages#beneficios'
  get 'beneficios/beneficio_investigador', to: 'pages#beneficio_investigador'
  get 'beneficios/beneficio_publico', to: 'pages#beneficio_publico'
  get 'beneficios/tendencia_mundial', to: 'pages#tendencia_mundial'
  get 'beneficios/tendencia_mundial', to: 'pages#tendencia_mundial'
  get 'testimonios', to: 'pages#testimonios'
  get 'politica', to: 'pages#politica'
  get 'politica/preguntas_frecuentes', to: 'pages#preguntas_frecuentes'
  get 'politica/derechos_bases_de_datos', to: 'pages#derechos_bases_de_datos'
  get 'politica/documentos', to: 'pages#documentos'
  get 'eventos', to: 'pages#eventos'
  get 'eventos/1', to: 'pages#evento_1'
  get 'noticias', to: 'pages#noticias'
  get 'noticias/1', to: 'pages#noticia_1'
  get 'noticias/2', to: 'pages#noticia_2'

  # FeedbackFields controller
  match '/feedback', to: "feedback_entries#index", via: :get
  match '/feedback', to: "feedback_entries#create", via: :post
  match '/feedback/:id', to: "feedback_entries#show", via: :get

  get "identities/new"
  resources :feedback_entries
  resources :roles

  get '/sessions/close'
  get '/sessions/login'
  get '/sessions/failure'
  resources :sessions
  resources :user_identities
  resources :users

  get "sessions/create"
  match '/auth/:provider/callback', to: "sessions#create", via: [:get, :post]
  get '/auth/failure', to: 'sessions#failure'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
