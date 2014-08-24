VfestMail::Application.routes.draw do
  root 'vfsubscribe#index'
  post 'vfsubscribe/subscribe' => 'vfsubscribe#subscribe'
end
