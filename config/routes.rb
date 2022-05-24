Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    api_version(
      module: 'V1',
      header: { name: 'Accept', value: 'application/directshift.test; version=1' },
      default: { format: :json }
    ) do
      devise_for :users, controllers: { sessions: 'api/v1/users/sessions', registrations: 'api/v1/users/registration' }
 	end
 end
end
