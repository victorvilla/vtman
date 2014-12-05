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
    # flag = false
    if flag
      id = this.id
      console.log "/voice_talent_users/#{id}/edit"
      callback = (response) ->
        vt = response.voice_talent_user
        #console.log 'correction_rate: ' + vt.first_name + '. rush_full_rate: ' + vt.rush_full_rate + '. rush_partial_rate: ' + vt.rush_partial_rate

        #$('#editVoiceTalentUserForm').modal('show')
        #$('#myModal').modal('hide');
        #$('#first_name').val(vt.first_name)
        $('.modal-body #first_name').val(vt.first_name)
        $('.modal-body #last_name').val(vt.last_name)
        $('.modal-body #nickname').val(vt.nickname)
        $('.modal-body #is_veteran').val('' + vt.is_veteran)
        $('.modal-body #email').val(vt.email)
        $('.modal-body #full_rate').val(vt.full_rate)
        $('.modal-body #rush_full_rate').val(vt.rush_full_rate)
        $('.modal-body #partial_rate').val(vt.partial_rate)
        $('.modal-body #rush_partial_rate').val(vt.rush_partial_rate)
        $('.modal-body #correction_rate').val(vt.correction_rate)
        $('#voice-talent-admin').append("<%= j render partial: 'edit', locals: {voice_talent_user: voice_talent_user } %>")

      #$.get "/voice_talent_users/#{id}/edit", callback, 'json'


$ ->
  callback = (event) ->
    button = $(event.relatedTarget)
    recipient = button.data('whatever')
    # console.log 'recipient ' + recipient
    elements = recipient.split(':')

    modal = $(this)
    modal.find('.modal-body #first_name').val(elements[1])
    modal.find('.modal-body #last_name').val(elements[2])
    modal.find('.modal-body #nickname').val(elements[3])
    modal.find('.modal-body #is_veteran').val(elements[4])
    modal.find('.modal-body #email').val(elements[5])
    modal.find('.modal-body #full_rate').val(elements[6])
    modal.find('.modal-body #rush_full_rate').val(elements[7])
    modal.find('.modal-body #partial_rate').val(elements[8])
    modal.find('.modal-body #rush_partial_rate').val(elements[9])
    modal.find('.modal-body #correction_rate').val(elements[10])
    modal.find('.modal-body #id').val(elements[0])

  #$('#editVoiceTalentUserForm').on('show.bs.modal', callback)

# $('#voice-talent-admin').append("<%= j render partial: 'edit', locals: {voice_talent_user: voice_talent_user } %>")
## $('#editVoiceTalentUserForm').modal_success();