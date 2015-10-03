class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    Instagram.configure do |config|
      config.client_id = "614bd5033e9c4492a5da0a515e505b99"
      config.client_secret = "3c6f57829870483599f1fa5772ef2a2a"
      # For secured endpoints only
      #config.client_ips = '<Comma separated list of IPs>'
    end
    callback_url = "http://localhost:3000/artist"
    redirect_to Instagram.authorize_url(:redirect_uri => callback_url)
    # response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
    # session[:access_token] = response.access_token
    # redirect "/artists"
    # @instagram = Instagram.user_recent_media("614bd5033e9c4492a5da0a515e505b99")
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    #@artist.set_artist_instagram_session
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params[:artist]
    end
end
