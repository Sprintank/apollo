Rails.application.config.middleware.use OmniAuth::Builder do
  provider :soundcloud, ENV['SOUNDCLOUD_CLIENT_ID'], ENV['SOUNDCLOUD_SECRET'], {provider_ignores_state: true}
end
