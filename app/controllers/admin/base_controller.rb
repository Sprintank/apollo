class Admin::BaseController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'

  private

  def load_default_band
    @band = current_user.default_band
  end

  def ensure_band_admin_or_redirect_user
    unless can? :admin, @band
      flash[:notice] = t('admin.band.not_authorized')
      redirect_to root_path
    end
  end

end