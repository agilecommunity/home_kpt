Rails.application.routes.draw do
  root to: 'memos#current'

  resources :memos do
    get :current, on: :collection
  end
end
