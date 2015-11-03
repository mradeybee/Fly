Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1053979624636943', '137142ba28f45f1874c9611700307fc0'
end