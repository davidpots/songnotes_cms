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
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @song = Song.find(params[:id])
    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
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