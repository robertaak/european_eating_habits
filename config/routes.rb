Rails.application.routes.draw do
  resources :entries
  root "entries#home"
end
