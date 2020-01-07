Rails.application.routes.draw do
  get 'top/index'
  get 'home/index'
  post 'command/form'
  post 'conscription/update'
end
