Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      scope :medical_procedures do
        get "search" => "medical_procedures#search"
      end
    end
  end
end
