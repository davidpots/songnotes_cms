class Admin::ArtistsController < Admin::BaseController
  before_filter :prepare_songs, :except => :index
  before_filter :prepare_albums, :except => :index

  def index
    @artists = Artist.order(sort_column + ' ' + sort_direction)
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to admin_artists_url, notice: "Successfully created artist."
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to admin_artists_url, notice: "Successfully updated artist."    
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to admin_artists_url }
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
    @artists = Song.all
  end

  def prepare_albums
    @albums = Album.all
  end
end