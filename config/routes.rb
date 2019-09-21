Rails.application.routes.draw do
  root "urls#new"
	get '/show_all', to: 'urls#show_all'
	post "/", to: 'urls#create'
	get "/", to: 'urls#new'
	get '/:id', to: 'urls#show'
end
