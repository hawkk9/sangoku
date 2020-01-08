Rails.application.routes.draw do
  get 'top/index'
  get 'home/index'
  post 'command/form'

  get 'conscription/form'
  post 'conscription/update'
end
