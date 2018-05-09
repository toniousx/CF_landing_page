Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'courses#index'

  get ':slug', to: 'courses#show' # *Needs to be the last to don't overwrite any future roots
end
