class BandsController < ApplicationController
  include FieldOptions
  layout "theme"

  before_action :load_all_field_options

  def show
    @band = Band.where(identifier: params[:id]).first
    render :template => "themes/#{ @band.theme.identifier }/show"
  end
end