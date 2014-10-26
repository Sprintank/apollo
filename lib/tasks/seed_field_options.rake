namespace :db do
  task :seed_field_options => :environment do

    print "\n== rake db:seed_field_options starting... =================\n"

    # social fields
    FieldOption.find_or_create_by(:identifier => 'social_twitter').update_attributes(:name => 'Twitter', :kind => FieldOption::KIND[:social], :order => 1 )
    FieldOption.find_or_create_by(:identifier => 'social_soundcloud').update_attributes(:name => 'Soundcloud', :kind => FieldOption::KIND[:social], :order => 2 )
    FieldOption.find_or_create_by(:identifier => 'social_facebook').update_attributes(:name => 'Facebook', :kind => FieldOption::KIND[:social], :order => 3 )
    FieldOption.find_or_create_by(:identifier => 'social_spotify').update_attributes(:name => 'Spotify', :kind => FieldOption::KIND[:social], :order => 4 )
    FieldOption.find_or_create_by(:identifier => 'social_instagram').update_attributes(:name => 'Instagram', :kind => FieldOption::KIND[:social], :order => 5 )

    # color pickers
    FieldOption.find_or_create_by(:identifier => 'main_color').update_attributes(:name => 'Main', :kind => FieldOption::KIND[:color], :order => 0 )
    FieldOption.find_or_create_by(:identifier => 'text_color').update_attributes(:name => 'Text', :kind => FieldOption::KIND[:color], :order => 0 )
    FieldOption.find_or_create_by(:identifier => 'music_background_color').update_attributes(:name => 'Music Background', :kind => FieldOption::KIND[:color], :order => 0 )
    FieldOption.find_or_create_by(:identifier => 'background_overlay_color').update_attributes(:name => 'Background Overlay Color', :kind => FieldOption::KIND[:color], :order => 2 )


    print "\n== rake db:seed_field_options complete!   =================\n\n"
  end
end
