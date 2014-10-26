namespace :db do
  task :seed_field_options => :environment do

    print "\n== rake db:seed_field_options starting... =================\n"

    # social fields
    FieldOption.find_or_create_by(:name => 'social_twitter_field').update_attributes(:kind => FieldOption::KIND[:social], :order => 1 )
    FieldOption.find_or_create_by(:name => 'social_soundcloud_field').update_attributes(:kind => FieldOption::KIND[:social], :order => 2 )
    FieldOption.find_or_create_by(:name => 'social_facebook_field').update_attributes(:kind => FieldOption::KIND[:social], :order => 3 )
    FieldOption.find_or_create_by(:name => 'social_spotify_field').update_attributes(:kind => FieldOption::KIND[:social], :order => 4 )
    FieldOption.find_or_create_by(:name => 'social_instagram_field').update_attributes(:kind => FieldOption::KIND[:social], :order => 5 )

    print "\n== rake db:seed_field_options complete!   =================\n"
  end
end
