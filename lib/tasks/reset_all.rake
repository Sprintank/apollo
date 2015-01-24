namespace :db do
  desc "Raise an error unless the Rails.env is development"
  task :development_environment_only do
    raise "not fit for prod!" if Rails.env.production?
  end
  desc "Drop, create, migrate then seed the development database"
  task :reset_all => [
      'environment',
      'db:development_environment_only',
      'db:drop',
      'db:create',
      'db:migrate',
      'db:seed',
      'db:seed_field_options',
      'db:seed_themes',
    ]
end