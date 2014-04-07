CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage       = :file
    config.enable_processing = false
  else
    config.storage       = :fog
  end

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJOEOYEOCHHQWXNGA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'ap-southeast-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'clinicsabroadprod'                     # required
  config.fog_public     = true                                    # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end