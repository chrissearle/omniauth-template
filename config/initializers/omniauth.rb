LOGIN_PROVIDERS = [:flickr, :twitter, :facebook]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flickr, ENV['FLICKR_API_KEY'], ENV['FLICKR_SECRET'], :scope => 'read'
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], {:scope => 'email'}
end
