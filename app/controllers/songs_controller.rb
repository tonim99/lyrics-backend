class SongsController < ApplicationController
  # before_action :set_song, only: [:show, :update, :destroy]

  before_action :set_song, only: [:show, :update, :destroy]
  #  except: [:search_by_artist, :search_by_track, :search_by_lyrics, :search_lyrics, :search_track_id]
  # :authorized,
  # GET /songs
  def index
    @songs = Song.all

    render json: @songs
  end

  # GET /songs/1
  def show
    render json: @song
  end

  # POST /songs
  def create
    @song = Song.new(song_params)

    if @song.save
      render json: @song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
  end

  def search_by_artist
    res = Faraday.get("https://api.musixmatch.com/ws/1.1/track.search?format=jsonp&callback=callback&q_artist=#{params[:search]}&f_has_lyrics=1&apikey=#{ENV['apikey']}") 
    render json: res.body
  end

  def search_by_track
    res = Faraday.get("https://api.musixmatch.com/ws/1.1/track.search?format=jsonp&callback=callback&q_track=#{params[:search]}&f_has_lyrics=1&apikey=#{ENV['apikey']}") 
    render json: res.body
  end

  def search_by_lyrics
    res = Faraday.get("https://api.musixmatch.com/ws/1.1/track.search?format=jsonp&callback=callback&q_lyrics=#{params[:search]}&f_has_lyrics=1&apikey=#{ENV['apikey']}") 
    render json: res.body
  end

  # def search_lyrics
  #   res = Faraday.get("https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?format=jsonp&callback=callback&q_track=#{params[:search]}&q_artist=#{params[:search2]}&apikey=#{ENV['apikey']}") 
  #   render json: res.body
  # end

def search_track_id
  res = Faraday.get("https://api.musixmatch.com/ws/1.1/track.lyrics.get?format=jsonp&callback=callback&track_id=#{params[:search]}&apikey=#{ENV['apikey']}")
  render json: res.body
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:name, :artist, :lyrics)
    end
end
