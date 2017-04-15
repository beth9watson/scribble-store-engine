ScribbleStore::Engine.routes.draw do
  resources :scribbles

  root to: 'scribbles#new'
end
