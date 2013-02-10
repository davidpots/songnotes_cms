class SongsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @nav = sort_column
    # @songs = Song.order(sort_column + ' ' + sort_direction)
    @songs_all = Song.where(published: true).all(:order => 'created_at DESC')
    # @songs = Song.where(published: true).all
    # @songs_by_months = @songs_all.group_by { |t| t.created_at.beginning_of_month }
    @songs_by_months = Song.where(published: true).all(:order => 'created_at DESC').group_by { |s| s.created_at.beginning_of_month }
    @songs_by_artist = Song.where(published: true).all(:order => 'title ASC').group_by { |s| s.artist }
    @songs_by_year = Song.where(published: true).all(:order => 'year DESC').group_by { |s| ((s.year/10)*10) }
    @songs_by_created_at = Song.where(published: true).all(:order => 'created_at DESC').group_by { |s| s.created_at }
    @songs_by_title = Song.where(published: true).all(:order => 'title ASC').group_by { |s| s.title[0].capitalize.match(/[A-Z]/) ? s.title[0].capitalize : "#" }
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
    params[:sort] || "recent"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
end