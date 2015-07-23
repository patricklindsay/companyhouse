Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "companies", to: "companies#index"
      get "companies/:id", to: "companies#show"
      get "companies/:id/charges", to: "companies#charges"
    end
  end
end
