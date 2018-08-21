Rails.application.routes.draw do

  devise_for :users
  #get 'welcome/index'
 post 'welcome/index'
 resources :articles do
  resources :comments, only: [:create,:destroy,:update]
 end

 #[:create]
  
 # HTTP 
  #Verbos: 
  #get "/articles" index
  #get "/articles /:id"  show
  #get "/articles /new"  new
  #get "/articles /id:edit" edit
  #post "/articles"create
  #patch "/articles/:id" update
  #put "/articles:id" update
  #delete "/articles" delete

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
