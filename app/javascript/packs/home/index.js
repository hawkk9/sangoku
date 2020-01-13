document.addEventListener("DOMContentLoaded",function(){
  document.getElementById('submit_command').addEventListener('click', submit_command)
});

function submit_command() {
  const form = document.getElementById('command_form')
  const command_type = document.getElementById('command_type').value

  if(gon.command_map.hasOwnProperty(command_type)) {
    const command = gon.command_map[command_type]
    form.method = command.method
    form.action = command.action
    if(form.method === 'get') {
      const token = document.getElementById('token')
      token.disabled = true
    }
  }

  form.submit()
}