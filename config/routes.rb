Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # devise_for :users, defaults: { format: :json }

  get '/', to: redirect('/api-docs')

  resources :users, except: :edit
  resources :boards, except: :edit do
    resources :board_lists, except: :edit do
      resources :list_tasks, except: :edit
    end
  end
end