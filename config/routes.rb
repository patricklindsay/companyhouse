Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "companies", to: "companies#index"
    end
  end
end
