Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_KEY'],
 :scope => 'email', :info_fields => 'name, email'
end