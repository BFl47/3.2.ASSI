Rails.application.routes.draw do
  resources :moviegoers
  resources :movies do
    resources :reviews
  end
  root :to => redirect('/movies')  

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#fail'
  get '/session/destroy' => 'sessions#destroy'

end