Rails.application.routes.draw do

  get "/surgeries/new", to: "surgeries#new"
  get "/surgeries/:id", to: "surgeries#show"
  get "/surgeries", to: "surgeries#index"
  post '/surgeries', to: 'surgeries#create'

  patch "/surgeries/:id", to: "surgeries#update"
end
