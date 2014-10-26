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
    @text_color_field_option = FieldOption.find_by(:identifier => 'text_color')
    @music_background_color_field_option = FieldOption.find_by(:identifier => 'music_background_color')
    @background_overlay_color_field_option = FieldOption.find_by(:identifier => 'background_overlay_color')
    @social_field_options = FieldOption.social.all
  end

end