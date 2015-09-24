CarrierWave.configure do |config|
	config.fog_credentials = {
	:provider => 'AWS', # required
	:aws_access_key_id => 'AKIAILTLD2Z6O5AIQLTA', # required
	:aws_secret_access_key => 'CO1cQkUA+5clhcViuk46El4JOjW3Cva1fdgLe75Z', # required
	:region  => 'ap-southeast-1',
  }
	case Rails.env
    when 'production'
      config.fog_directory = 'dummy'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dummy'
 
    when 'development'
      config.fog_directory = 'dev.dummy'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.dummy'
 
    when 'test'
      config.fog_directory = 'test.dummy'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.dummy'
  end
end