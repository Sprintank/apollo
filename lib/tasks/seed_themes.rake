namespace :db do
  task :seed_themes => :environment do

    print "\n== rake db:seed_themes (w/ defaults) starting... =================\n"

    main_color_option = FieldOption.find_by(:identifier => 'main_color')
    text_color_option = FieldOption.find_by(:identifier => 'text_color')
    music_bg_color_option = FieldOption.find_by(:identifier => 'music_background_color')
    bg_image_option = FieldOption.find_by(:identifier => 'background_image')

    # main_font_option = FieldOption.find_by(:identifier => 'main_font')
    # text_font_option = FieldOption.find_by(:identifier => 'text_font')

    bg_overlay_color_option = FieldOption.find_by(:identifier => 'background_overlay_color')
    bg_overlay_opacity_option = FieldOption.find_by(:identifier => 'background_overlay_opacity')

    theme01 = Theme.find_or_create_by(:identifier => 'theme01', is_featured: true)
    FieldOptionDefault.find_or_create_by(:theme => theme01, :field_option => main_color_option).update_attributes(value: '#ffffff')
    FieldOptionDefault.find_or_create_by(:theme => theme01, :field_option => text_color_option).update_attributes(value: '#000000')
    # FieldOptionDefault.find_or_create_by(:theme => theme01, :field_option => main_font_option).update_attributes(value: '')
    # FieldOptionDefault.find_or_create_by(:theme => theme01, :field_option => text_font_option).update_attributes(value: '')

    FieldOptionDefault.find_or_create_by(:theme => theme01, :field_option => bg_overlay_color_option).update_attributes(value: '#ffffff')
    FieldOptionDefault.find_or_create_by(:theme => theme01, :field_option => bg_overlay_opacity_option).update_attributes(value: '0')
    FieldOptionDefault.find_or_create_by(:theme => theme01, :field_option => music_bg_color_option).update_attributes(value: '#808080')



    print "\n== rake db:seed_themes (w/ defaults) complete!   =================\n\n"
  end
end
