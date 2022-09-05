Rails.application.routes.draw do
  get 'fashion_posts/index'
  post 'fashion_post/predict', to: 'fashion_posts#predict'
  get 'fashion_post/result', to: 'fashion_posts#result'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
