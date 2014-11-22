class Admin::BandsController < Admin::BaseController

  before_action :load_default_band
  before_action :load_field_options, :only => :edit
  before_action :ensure_band_admin_or_redirect_user

  def edit
  end

  def update
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
    @text_color_field_option = FieldOption.find_by(:identifier => 'text_color')
    @music_background_color_field_option = FieldOption.find_by(:identifier => 'music_background_color')
    @background_image_field_option = FieldOption.find_by(:identifier => 'background_image')
    @background_overlay_color_field_option = FieldOption.find_by(:identifier => 'background_overlay_color')
    @social_field_options = FieldOption.social.all
  end

end