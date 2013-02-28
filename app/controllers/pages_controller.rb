class PagesController < ApplicationController
  layout 'redux'
  def home
    @songs_by_months = Song.where(published: true).all(:order => 'created_at DESC', :limit => 7)
    @songs_random = Song.where(published: true).all(:order => 'created_at DESC').sample(7)
    @song_count = Song.where(published: true).count
  end
  def sandbox
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