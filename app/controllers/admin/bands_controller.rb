class Admin::BandsController < Admin::BaseController

  before_action :load_default_band
  before_action :ensure_band_admin_or_redirect_user

  def edit
  end

  def update
    @band.update_attributes(band_params)
    redirect_to admin_edit_band_path
  end

  private

  def band_params
    params.require(:band).permit(:name, :social_connections => [:uri, :service])
  end
end