class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :layout_vars
  def layout_vars
    @page_url = "http://www.songnotes.cc#{request.fullpath}"
    @google_font_Bitter = "Bitter:400,700,400italic"
    @google_font_Anonymous = "Anonymous+Pro:400,700"
    @google_font_OpenSans = "Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300"
    @google_font_AveriaSerifLibre = "Averia+Serif+Libre:300,400,700,300italic,400italic,700italic"
    @google_font_SourceCodePro = "Source+Code+Pro:300,400,600,700"  
    @artist_img_dir = "http://fireflygrove.com/songnotes/images/artists/"
  end
end
