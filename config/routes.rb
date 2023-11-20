Rails.application.routes.draw do
  # devise_for :users, defaults: { format: :json }

  resources :users, except: :edit
  resources :boards, except: :edit do
    resources :board_lists, except: :edit do
      resources :list_tasks, except: :edit
    end
  end
end