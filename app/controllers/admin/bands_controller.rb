class Admin::BandsController < Admin::BaseController

  before_action :load_default_band
  before_action :load_field_options, :only => :edit
  before_action :ensure_band_admin_or_redirect_user

  def edit
  end

  def update
    @band.update_attributes(name: band_params[:name])

    band_params[:field_option_values].each do |identifier,value|
      @band.update_field_value(value, FieldOption.find_by(:identifier => identifier))
    end
    redirect_to admin_edit_band_path
  end

  private

  def band_params
    params.require(:band).permit(:name).tap do |whitelisted|
      whitelisted[:field_option_values] = params[:band][:field_option_values]
    end
  end

  def load_field_options
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
  end

end