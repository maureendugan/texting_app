TextApp::Application.routes.draw do
  root to: 'messages#index'
  resources :messages
  resources :contacts do
    resources :messages
  end


end
