// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("DOMContentLoaded",function(){
  document.getElementById('submit_command').addEventListener('click', submit_command)
});

function submit_command() {
  const form = document.getElementById('command_form')
  const command_type = document.getElementById('command_type').value
  const token = document.getElementById('token')

  if(gon.command_map.hasOwnProperty(command_type)) {
    const command = gon.command_map[command_type]
    form.method = command.method
    form.action = command.action
    token.disabled = true
  }

  form.submit()
}

