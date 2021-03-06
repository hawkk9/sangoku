Rails.application.routes.draw do
  get '/top/index' => 'top#index'
  get '/home/index' => 'home#index'
  post '/command/update' => 'command#update'

  # 徴兵
  get '/conscription/form' => 'conscription#form'
  post '/conscription/update' => 'conscription#update'

  # 戦争
  get '/war/form' => 'war#form'
  post '/war/update' => 'war#update'

  # デバッグ
  post '/debug/execute_command' => 'debug#execute_command'
  post '/debug/change_user' => 'debug#change_user'
end
