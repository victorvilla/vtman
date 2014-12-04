$ ->
  $('#voice-talent-admin').dataTable(
    paging:   false,
    searching: false,
    info:     false,
    columnDefs: [{ "orderable": false, "targets": [2,3,4,5,6,7,8] }]
  )

$ ->
  $('a').click ->
    flag = /^\+?(0|[1-9]\d*)$/.test(this.id);
    if flag
      id = this.id
      callback = (response) ->
        vt = response.voice_talent_user
        console.log 'correction_rate: ' + vt.first_name + '. rush_full_rate: ' + vt.rush_full_rate + '. rush_partial_rate: ' + vt.rush_partial_rate
        # $('#first_name').val(vt.first_name)

      $.get "/voice_talent_users/#{id}/edit/", callback, 'json'


$ ->
  callback = (event) ->
    button = $(event.relatedTarget)
    recipient = button.data('whatever')
    modal = $(this)
    # modal.find('.modal-title').text('New message to ' + recipient)
    #modal.find('.modal-body #first_name').val(recipient)

  $('#editVoiceTalentUserForm').on('show.bs.modal', callback)