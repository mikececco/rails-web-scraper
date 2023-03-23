Rails.application.routes.draw do
  resources :recipes do
    match '/scrape', to: 'recipes#scrape', via: :post, on: :collection
  end

  root to: 'recipes#index'
end
