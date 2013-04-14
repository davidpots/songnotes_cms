class PagesController < ApplicationController
  layout 'redux'
  def home
    # Added Apr14, most recent
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 12)

    # From February, probably can be improved or removed eventually
    @songs_by_months = Song.where(published: true).all(:order => 'created_at DESC', :limit => 7)
    @songs_random = Song.where(published: true).all(:order => 'created_at DESC').sample(12)
    @song_count = Song.where(published: true).count
  end
  def sandbox
    @recent_songs = Song.where(published: true).all(order: 'created_at DESC', limit: 12)
    @artists = Artist.all(order: 'name', limit: 10)




    @songs_by_artist = Song.where(published: true).all(:order => 'title ASC', :limit => 12).group_by { |s| s.artist }    
    @songs_by_title = Song.where(published: true).all(:order => 'title ASC', :limit => 12).group_by { |s| s.title[0].capitalize.match(/[A-Z]/) ? s.title[0].capitalize : "#" }

    # This is all the thing where you extract just the raw text lyrics
    # ----
    @song = Song.find(5)
    html_doc = Nokogiri::XML(@song.lyrics_html_mono)
    html_doc.xpath('//strong').each {|x| x.remove}
    html_doc.xpath('//span').each {|x| x.remove}
    html_doc.xpath('//h4').each {|x| x.remove}
    @doc = html_doc.to_s
    # Gets rid of spaces
    @new_doc = @doc.gsub("\s\s\s\s","")
    # Gets rid of duplicate line breaks
    @new_doc = @new_doc.gsub("\n\n\n","\n\n")
    # Gets rid of leading line break (start of text)... SEEMS LIKE COULD BE WAY BETTER!
    @new_doc = @new_doc.sub("\n","")
    render :layout => 'sandbox'
  end
end