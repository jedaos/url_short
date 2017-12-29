Rails.application.routes.draw do

get '/url_short/new'

post '/url_short/new' => 'url_short#create'

get '/url_short/:id' => 'url_short#show', as: 'url'

root 'url_short#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
