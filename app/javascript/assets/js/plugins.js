function iniciarNotificaciones() {
  $.notifyDefaults({
    type: 'success',
    allow_dismiss: true
  })
}

$(document).ready(() => {
  iniciarNotificaciones()
})
