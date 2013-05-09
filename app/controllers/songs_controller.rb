class SongsController < ApplicationController
  before_filter :prepare_artists, :prepare_albums
  helper_method :sort_column, :sort_direction

  def index
  end

  def show
    # Song being viewed
    @song = Song.find(params[:id])

    # Songs from same year as @song
    @year = @song.year
    @songs_same_year = Song.where(published: true, year: @year).all(:order => 'title ASC')

    # Songs recently added to the site
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 8)
  end

  def admin
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
      redirect_to admin_url, notice: "Successfully created song."
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      redirect_to admin_url, notice: "Successfully updated song."    
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    respond_to do |format|
      format.html { redirect_to admin_url, notice: "Successfully deleted song." }
      format.json { head :no_content }
    end
  end
  
  private

  def sort_column
    params[:sort] || "title"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
  
  def prepare_artists
    @artists = Artist.all(order: 'lower(name)')
  end

  def prepare_albums
    @albums = Album.all
  end
  
end