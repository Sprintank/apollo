class Admin::BandsController < Admin::BaseController
  include FieldOptions

  before_action :load_default_band
  before_action :load_all_field_options, :only => :edit
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

end