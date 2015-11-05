Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'FACEBOOK_APP_ID', 'FACEBOOK_APP_KEY', 
  scope: "public_profile, email", info_fields: "id, name, link, email", display: "popup"
end