class Admin::BaseController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'

  private

  def ensure_default_band
    current_user.grant_admin(current_user.build_initial_band) if current_user.default_band.nil? #this feels ugly
  end

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