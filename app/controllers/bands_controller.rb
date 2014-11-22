class BandsController < ApplicationController
  layout "theme"

  before_action :load_field_options

  def show
    @band = Band.where(identifier: params[:id]).first
    render :template => "themes/theme01/show"
  end


  private

  def load_field_options
    @main_color_field_option = FieldOption.find_by(:identifier => 'main_color')
    @main_color_font_option  = FieldOption.find_by(:identifier => 'main_font')

    @text_color_field_option = FieldOption.find_by(:identifier => 'text_color')
    @text_color_font_option  = FieldOption.find_by(:identifier => 'text_font')

    @music_background_color_field_option = FieldOption.find_by(:identifier => 'music_background_color')
    @background_image_field_option = FieldOption.find_by(:identifier => 'background_image')
    @background_overlay_color_field_option = FieldOption.find_by(:identifier => 'background_overlay_color')
    @background_overlay_opacity_field_option = FieldOption.find_by(:identifier => 'background_overlay_opacity')
    @social_field_options = FieldOption.social.all
  end

end