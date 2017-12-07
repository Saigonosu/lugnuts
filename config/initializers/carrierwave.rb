CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY'],
    aws_secret_access_key: ENV['SECRET_KEY']
  }
  config.fog_directory = 'lugnuts'
  config.fog_public = 'false'
end
