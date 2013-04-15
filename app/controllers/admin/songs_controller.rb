class Admin::SongsController < Admin::BaseController
  before_filter :prepare_artists, :except => :index
  before_filter :prepare_albums, :except => :index

  def index
    @songs = Song.order(sort_column + ' ' + sort_direction)
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to admin_songs_url, notice: "Successfully created song."
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      redirect_to admin_songs_url, notice: "Successfully updated song."    
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    respond_to do |format|
      format.html { redirect_to admin_songs_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    params[:sort] || "title"
  end
  helper_method :sort_column

  def sort_direction
    params[:direction] || "asc"
  end
  helper_method :sort_direction
  
  def prepare_artists
    @artists = Artist.all
  end

  def prepare_albums
    @albums = Album.all
  end
end
