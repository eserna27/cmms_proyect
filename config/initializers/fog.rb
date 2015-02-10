CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['aws_access_key_id'],       # required
      :aws_secret_access_key  => ENV['aws_secret_access_key']
    }

    config.fog_directory  = 'sinapsiscmms' 
   end
end