Rails.application.routes.draw do
  mount ScribbleStore::Engine => "/scribble_store"
end
