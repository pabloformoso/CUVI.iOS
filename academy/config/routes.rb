Academy::Application.routes.draw do

  resources :resources
  resources :aecomo_classes
  resources :stundents

  root :to => 'welcome#index'

  match ':controller(/:action(/:id))(.:format)'
end
