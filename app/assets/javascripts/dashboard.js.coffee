# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# ->
   # $('.cell-download').click ->
   # ajax download
   # success

$ ->
  $('#tasks').dataTable(
        paging:   false,
        searching: false,
        info:     false,
        columnDefs: [{ "orderable": false, "targets": [0,1,2,3,6,7,8] }]
    )

$(".cell-scripts").click ->
      data = $(this).data()
      $.get '/api/tasks/status', {id: data.id}, callback, 'json'

callback = (response) ->
  console.log response

  if response.status in ["notacknowledged", "acknowledged"]
    uploadicon = 'glyphicon glyphicon-open text-primary'
    statusicon = 'glyphicon glyphicon-time text-info'
    $("#up-icon-"+response.id).attr('class', uploadicon )
    $("#status-icon-"+response.id).attr('class', statusicon)

