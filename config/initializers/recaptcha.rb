Recaptcha.configure do |config|
  config.public_key  = '6LcpnQETAAAAAFiPL1YOUVh6bAC8PU9V-7TJwVCt'
  config.private_key = '6LcpnQETAAAAALVhKxy46nDNGMaqby2IDYfJdJoU'
  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'
  # Uncomment if you want to use the newer version of the API,
  # only works for versions >= 0.3.7:
  # config.api_version = 'v2'
end

#Recaptcha.with_configuration(:public_key => '12345') do
  # Do stuff with the overwritten public_key.
#end
