json.array!(@vt_files) do |vt_file|
  json.extract! vt_file, :id, :path_file, :task_id, :type
  json.url vt_file_url(vt_file, format: :json)
end
