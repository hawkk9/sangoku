Rails.application.routes.draw do
  get '/top/index' => 'top#index'
  get '/home/index' => 'home#index'
  post '/command/update' => 'command#update'

  # 徴兵
  get '/conscription/form' => 'conscription#form'
  post '/conscription/update' => 'conscription#update'

  # デバッグ
  post '/dubug/execute_command' => 'debug#execute_command'
end
