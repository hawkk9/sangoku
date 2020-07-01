document.addEventListener("DOMContentLoaded",function(){
  Array.from(document.getElementsByClassName('js-submit_command')).forEach(function(element) {
    element.addEventListener('click', submit_command);
  });
});

function submit_command() {
  const form = document.getElementById('command_form')
  const button = this
  const row = button.closest('tr')
  const soldier_num = row.getElementsByClassName('js-soldier_num')[0].value
  const soldier_type = row.getElementsByClassName('js-soldier_type')[0].value
  const soldier_rank = row.getElementsByClassName('js-soldier_rank')[0].value

  form.soldier_num.value = soldier_num
  form.soldier_type.value = soldier_type
  form.soldier_rank.value = soldier_rank

  form.submit()
}
