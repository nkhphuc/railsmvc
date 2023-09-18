# frozen_string_literal: true

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS'],
    aws_secret_access_key: ENV['SECRET'],
    region: 'ap-southeast-1'
  }
  config.fog_directory = 'railsmvc-assets'
  config.storage = :fog
end
