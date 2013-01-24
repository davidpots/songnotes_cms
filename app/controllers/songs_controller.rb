class SongsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @songs = Song.where(published: true).all(:order => 'title')
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
    params[:sort] || "title"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
end