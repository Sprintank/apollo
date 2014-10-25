class BandsController < ApplicationController
  def show
    @band = Band.where(identifier: params[:id]).first
  end
end