
$('#voice-talent-adminx').dataTable(
  paging:   false,
  searching: false,
  info:     false,
  processing: true,
  serverSide: true,
  ajax: $('#voice-talent-adminx').data('source')
  # columnDefs: [{ "orderable": false, "targets": [0,1,2,3,6,7,8] }]
)
