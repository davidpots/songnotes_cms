class SongsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @nav = sort_column
    # if @nav == 'title'
    #   @songs = Song.where(published: true).all(:order => 'title')
    # elsif @nav == 'created_at'
    #   @songs = Song.where(published: true).all(:order => 'created_at DESC')
    # elsif @nav == 'artist'
    #   @songs = Song.where(published: true).all(:order => 'artist').group_by(&:artist)
    # elsif @nav == 'year'
    #   @songs = Song.where(published: true).all(:order => 'year DESC').group_by(&:year)
    # end
    # @songs_newest = Song.where(published: true).all(:limit => 10, :order => 'created_at DESC')
    @songs = Song.order(sort_column + ' ' + sort_direction)
    @songs_by_artist = @songs.group_by { |s| s.artist }
    @songs_by_year = Song.where(published: true).all(:order => 'year DESC').group_by { |s| s.year }
    @songs_by_created_at = Song.where(published: true).all(:order => 'created_at DESC').group_by { |s| s.created_at }
    @songs_by_title = @songs.group_by { |s| s.created_at }
  end

  def show
    @song = Song.find(params[:id])
  end

  def admin
    @songs = Song.order(sort_column + ' ' + sort_direction)
  end

  def details
    @song = Song.find(params[:id])
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
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end
  
  private

  def sort_column
    params[:sort] || "created_at"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
end