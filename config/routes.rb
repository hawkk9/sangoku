Rails.application.routes.draw do
  get 'top/index'
  get 'home/index'
  post 'command/form'

  get '/conscription/form' => 'conscription#form'
  post '/conscription/update' => 'conscription#update'
end
