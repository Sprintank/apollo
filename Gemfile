source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '~> 4.1.6'
gem 'pg', '~> 0.17.1'

gem 'cancancan', '~> 1.9.2'
gem 'devise', '~> 3.4.0'

#front-end
gem 'sass-rails', '~> 4.0.0'
gem 'autoprefixer-rails', '~>  2.1.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails', '~> 3.1.0'
gem 'jquery-ui-rails', '~> 5.0.0'
gem 'responders', '~> 1.0.0'
gem 'slim-rails', '~> 2.1.4'
gem 'jquery-minicolors-rails', '~> 2.1.4.0'
gem "jquery-mousewheel-rails", '~> 0.0.9'
gem 'jscrollpane-rails', '~> 2.0.20'

gem 'paperclip', '~> 4.2'
gem 'aws-sdk'

gem 'google-analytics-rails', '~> 0.0.6'

#authentication
gem 'omniauth-soundcloud', '~> 1.0.1'
gem 'soundcloud', '~> 0.3.2'

group :test, :development do
  gem 'factory_girl_rails'
  gem 'pry-rescue'
  gem 'simplecov', :require => false
  gem 'minitest-reporters'
  gem 'faker', '~> 1.4.2', require: false
  gem 'minitest-spec-context'
end

group :development do
  gem 'dotenv-rails', '~> 1.0.2'
  gem 'html2slim'
  gem 'thin'
  gem 'quiet_assets'
  gem 'pry'
  gem 'pry-rails'
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'byebug'
  gem 'foreman'
  # gem 'guard', :require => false
  # gem 'guard-livereload', :require => false
  # gem 'rack-livereload'
  # gem 'rb-fsevent', :require => false
end


group :production, :staging, :qa do
  # gem 'rails_12factor', '~> 0.0.2'        # no need to serve static assets since they should be on S3 only
  gem 'rails_stdout_logging', '~> 0.0.3'    # use stdout_logging only for paperclip
  gem 'asset_sync', '~> 1.0.0'              # synchs assets up to S3
  gem 'newrelic_rpm'
  gem 'unicorn', '~> 4.8.3'
end
