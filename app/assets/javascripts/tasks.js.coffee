# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#task_voice_talent_user_id').change ->
    voice_talent_user_id = $('#task_voice_talent_user_id').find(":selected").val()
    if voice_talent_user_id == ''
       $("#task_type_script").val('')
       $("#task_number_chapters").val('')
       $('#task_rush').removeAttr("disabled")
       return

    d = new Date()
    d.setDate(d.getDate() + 1)
    format = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate()
    $('#task_due_date').val(format)  
 
    callback = (response) -> 
      console.log "is_veteran: " + response.voice_talent_user.is_veteran
      vt = response.voice_talent_user
      console.log 'correction_rate: ' + vt.correction_rate + '. rush_full_rate: ' + vt.rush_full_rate + '. rush_partial_rate: ' + vt.rush_partial_rate
      if vt.is_veteran == false
        $('#task_rush').val('true')
        $('#task_rush').attr("disabled", "disabled")
        $('#task_due_date').attr("disabled", "disabled")
      else
        $('#task_rush').removeAttr("disabled")
        $('#task_due_date').removeAttr("disabled")
        type_script_id = $('#task_type_script option:selected').val()
        if type_script_id == 'correction'
           $('#task_rush').val('true')
           $('#task_rush').attr("disabled", "disabled")
           $('#task_due_date').attr("disabled", "disabled")
        console.log 'full_rate: ' + vt.full_rate + '. partial_rate: ' + vt.partial_rate

      validate_rate(vt)
      
    $.get '/tasks/new/rate/', {voice_talent_user_id}, callback, 'json'


$ ->
  $('#task_type_script').change ->
    type_script_id = $('#task_type_script option:selected').val()
    if type_script_id == ''
       return
    console.log "type_script_id : " + type_script_id 
    $("#task_number_chapters").val(1)
    if type_script_id == 'partial'
      $('.chapters').show()
      $('#task_rush').removeAttr("disabled")
      $('#task_due_date').removeAttr("disabled")
    else if type_script_id == 'full'
      $('.chapters').hide()
      $('#task_rush').removeAttr("disabled")
      $('#task_due_date').removeAttr("disabled")
    else if type_script_id == 'correction'
      $('.chapters').hide()
      $('#task_rush').val('true')
      $('#task_rush').attr("disabled", "disabled")
      d = new Date()
      d.setDate(d.getDate() + 1)
      format = d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate()
      $('#task_due_date').val(format)
      $('#task_due_date').attr("disabled", "disabled")
    
    voice_talent_user_id = $('#task_voice_talent_user_id').find(":selected").val()
    if voice_talent_user_id == ''
      return
    callback = (response) -> 
      vt = response.voice_talent_user
      console.log 'correction_rate: ' + vt.correction_rate + '. rush_full_rate: ' + vt.rush_full_rate + '. rush_partial_rate: ' + vt.rush_partial_rate + '. full_rate: ' + vt.full_rate + '. partial_rate: ' + vt.partial_rate

      validate_rate(vt)
      
    $.get '/tasks/new/rate/', {voice_talent_user_id}, callback, 'json'

$ ->
  $('#task_number_chapters').change ->
    number_chapters = $('#task_number_chapters').val()
    if number_chapters == ''
       return
    console.log "number_chapters : " + number_chapters 
    
    voice_talent_user_id = $('#task_voice_talent_user_id').find(":selected").val()
    if voice_talent_user_id == ''
      return
    callback = (response) -> 
      vt = response.voice_talent_user
      console.log 'correction_rate: ' + vt.correction_rate + '. rush_full_rate: ' + vt.rush_full_rate + '. rush_partial_rate: ' + vt.rush_partial_rate + '. full_rate: ' + vt.full_rate + '. partial_rate: ' + vt.partial_rate

      validate_rate(vt)
      
    $.get '/tasks/new/rate/', {voice_talent_user_id}, callback, 'json'

$ ->
  $('#task_rush').change ->
    task_rush = $('#task_rush option:selected').val()
    if task_rush == ''
       return
    console.log "task_rush : " + task_rush 
    
    voice_talent_user_id = $('#task_voice_talent_user_id').find(":selected").val()
    if voice_talent_user_id == ''
      return
    callback = (response) -> 
      vt = response.voice_talent_user
      console.log 'correction_rate: ' + vt.correction_rate + '. rush_full_rate: ' + vt.rush_full_rate + '. rush_partial_rate: ' + vt.rush_partial_rate + '. full_rate: ' + vt.full_rate + '. partial_rate: ' + vt.partial_rate

      validate_rate(vt)
      
    $.get '/tasks/new/rate/', {voice_talent_user_id}, callback, 'json'

validate_rate = (vt) ->
      voice_talent_user_id = $('#task_voice_talent_user_id').find(":selected").val()
      type_script_id = $('#task_type_script option:selected').val()
      rush = $('#task_rush').val()
      num_chapters = $("#task_number_chapters").val()
  
      if type_script_id == '' || rush == '' || num_chapters == '' || voice_talent_user_id == ''
        return
      console.log "type_script_id : " + type_script_id + ". rush : " + rush + ". num_chapters : " + num_chapters
	  
      total = 0.0
      if type_script_id == 'partial'
        total = vt.partial_rate
        console.log '. partial_rate: ' + vt.partial_rate + ' (Default)'
        if rush == 'true'
          total = vt.rush_partial_rate
          console.log '. rush_partial_rate: ' + vt.rush_partial_rate + ' (Modified)'
        total *= num_chapters
      else if type_script_id == 'full'
        total = vt.full_rate
        console.log '. full_rate: ' + vt.full_rate + ' (Default)'
        if rush == 'true'
          total = vt.rush_full_rate
          console.log '. rush_full_rate: ' + vt.rush_full_rate + ' (Modified)'
      else if type_script_id == 'correction'
        total = vt.correction_rate
        console.log '. correction_rate: ' + vt.correction_rate
      
      $('#task_rate').val(total)
      console.log '. total: ' + $('#task_rate').val()
      $('.total').html('$ ' + total)
      #$('.total').html("<%= #{ number_to_currency @task.rate } %>")
	  
jQuery ->
  $(document).ready ->
    #$('#task_voice_talent_user_id').width(400).resize(true)
    #$('#task_content_ops_id').width(400).resize(true)
    #$('#task_client_id').width(400).resize(true)
    $('#task_type_script').width(190).resize(true)
    $('#task_rush').width(60).resize(true)
    console.log '. Contiene?: ' + $('#task_file')
    $('.input-group.date').datepicker({
      format: "mm-dd-yyyy",
      orientation: "top left"
      startDate: "10/31/2014",
      daysOfWeekDisabled: "0,6",
      todayHighlight: true,
      autoclose: true
    })