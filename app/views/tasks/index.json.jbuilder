json.array!(@tasks) do |task|
  json.extract! task, :id, :vtn, :cops, :client, :video_title, :type_script, :number_chapters, :notes, :rush, :rate, :due_date, :vt_file_id, :status
  json.url task_url(task, format: :json)
end
