class HouseCleaningController < ApplicationController
  def set_browser_dimensions
    session[:browser_width] = params[:width]
    session[:browser_height] = params[:height]
    head 200, :content_type => 'text/html'
  end
end
