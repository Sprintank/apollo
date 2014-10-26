class BandsController < ApplicationController
  layout "theme"
  def show
    @band = Band.where(identifier: params[:id]).first
    render :template => "themes/theme01/show"
  end
end