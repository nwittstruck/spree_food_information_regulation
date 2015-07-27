Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  mount Spree::Core::Engine, :at => '/'
  namespace :spree do
    namespace :api, defaults: { format: 'json' } do
      resources :food_information
    end
  end

end
