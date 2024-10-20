Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'session#create'
  get '/auth/failure' => 'session#fail'
  get '/session/destroy' => 'session#destroy'

  resources :moviegoers
  resources :movies do
    resources :reviews
  end
  root :to => redirect('/movies')
end
