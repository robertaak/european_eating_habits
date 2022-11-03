Rails.application.routes.draw do
  get 'about/index'
  resources :population_groups
  resources :food_groups
  resources :countries
  resources :entries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/entries/top/country/:country', to: 'entries#country_top'
  get '/entries/top/group/:population_group', to: 'entries#population_group_top'
  get '/entries/top/food/:food_group', to: 'entries#food_group_top'

  get '/entries/country/:country', to: 'entries#country'
  get '/entries/group/:population_group', to: 'entries#population_group'
  get '/entries/food/:food_group', to: 'entries#food_group'

  # Defines the root path route ("/")
  root "entries#home"
end
