CarrierWave.configure do |config|
  config.fog_credentials = {
  # Configuration for Amazon S3 should be made available through an Environment variable.
  # For local installations, export the env variable through the shell OR
  # if using Passenger, set an Apache environment variable.

  # Configuration for Amazon S3
  :provider => 'AWS',
  :aws_access_key_id => ENV['S3_KEY'],
  :aws_secret_access_key => ENV['S3_SECRET']
}

# For testing, upload files to local `tmp` folder.
if Rails.env.test? || Rails.env.cucumber?
config.storage = :file
config.enable_processing = false
config.root = "#{Rails.root}/tmp"
else
config.storage = :fog
config.fog_directory = ENV['S3_BUCKET_NAME']
config.fog_public     = false
end

config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on heroku



end
