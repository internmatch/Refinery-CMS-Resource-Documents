::Refinery::Application.routes.draw do
  resources :resource_documents, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :resource_documents, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :resource_categories, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :resource_categories, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
