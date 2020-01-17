document.addEventListener("DOMContentLoaded",function(){
  document.getElementById('js-submit_command').addEventListener('click', submit_command);
});

function submit_command() {
  const form = document.getElementById('command_form')
  const mode_radio = document.querySelector('input[name="mode"]:checked')
  const mode = mode_radio && mode_radio.value
  const town_id_radio = document.querySelector('input[name="town_id"]:checked')
  const town_id = town_id_radio && town_id_radio.value

  form.mode.value = mode
  form.town_id.value = town_id

  form.submit()
}
