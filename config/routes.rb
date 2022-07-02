Rails.application.routes.draw do
  resources :repositories, only: %i[index show]

  root to: redirect('/repositories', status: 302)
end
