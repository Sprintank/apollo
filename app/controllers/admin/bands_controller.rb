class Admin::BandsController < Admin::BaseController

  before_action :load_default_band
  before_action :ensure_band_admin_or_redirect_user

  def edit
  end

end