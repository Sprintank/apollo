module FieldOptions
  extend ActiveSupport::Concern

  def load_all_field_options
    @main_color_field_option = FieldOption.find_by(:identifier => 'main_color')
    @main_color_font_option  = FieldOption.find_by(:identifier => 'main_font')

    @text_color_field_option = FieldOption.find_by(:identifier => 'text_color')
    @text_color_font_option  = FieldOption.find_by(:identifier => 'text_font')

    @music_background_color_field_option = FieldOption.find_by(:identifier => 'music_background_color')
    @soundcloud_track_field_option = FieldOption.find_by(:identifier => 'music_soundcloud_track')
    @background_image_field_option = FieldOption.find_by(:identifier => 'background_image')
    @background_overlay_color_field_option = FieldOption.find_by(:identifier => 'background_overlay_color')
    @background_overlay_opacity_field_option = FieldOption.find_by(:identifier => 'background_overlay_opacity')

    @social_field_options = FieldOption.social.all
    @music_field_options = FieldOption.music.all

    @music_type_option = FieldOption.find_by(:identifier => 'music_type')
    @music_title_option = FieldOption.find_by(:identifier => 'music_title')
    @music_desc_option = FieldOption.find_by(:identifier => 'music_desc')
    @music_button_text_option = FieldOption.find_by(:identifier => 'music_button_text')
    @music_button_url_option = FieldOption.find_by(:identifier => 'music_button_url')
  end
end