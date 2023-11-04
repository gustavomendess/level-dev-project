Rails.application.routes.draw do
  mount ::LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount ::Sidekiq::Web, at: '/sidekiq'

  resources :comments
  resources :posts

  root to: "welcome#index"

  get "/topics", to: "topics#index"
  post "/topics", to: "topics#create"
  get "/topics/new", to: "topics#new", as: :new_topic
  get "/topics/:id/edit", to: "topics#edit", as: :edit_topic

  get "/topics/:id", to: "topics#show", as: :topic
  patch "/topics/:id", to: "topics#update"
  put "/topics/:id", to: "topics#update"
  delete "/topics/:id", to: "topics#destroy"
end