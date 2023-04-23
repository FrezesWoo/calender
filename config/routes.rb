Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    collection do
      get :index # 用户首页交互页面
      post :login # 用户提交登陆
      get :meeting # 预约日历页面
    end
  end
end
