namespace :db do
  task :seed_themes => :environment do

    print "\n== rake db:seed_themes starting... =================\n"

    # social fields

    theme01 = Theme.find_or_create_by(:identifier => 'theme01', is_featured: true)

    print "\n== rake db:seed_themes complete!   =================\n\n"
  end
end
