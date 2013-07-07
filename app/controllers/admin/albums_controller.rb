class Admin::AlbumsController < Admin::BaseController
  before_filter :prepare_songs, :except => :index
  before_filter :prepare_artists, :except => :index

  def index
    @albums = Album.order(sort_column + ' ' + sort_direction)
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to admin_albums_url, notice: "Successfully created album."
    else
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to admin_albums_url, notice: "Successfully updated album."    
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    respond_to do |format|
      format.html { redirect_to admin_albums_url, notice: "Successfully deleted album." }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    params[:sort] || "name"
  end
  helper_method :sort_column

  def sort_direction
    params[:direction] || "asc"
  end
  helper_method :sort_direction
  
  def prepare_songs
    @albums = Song.find(:all, :order => "LOWER(title)")
  end

  def prepare_artists
    @artists = Artist.find(:all, :order => "LOWER(name)")
  end
end