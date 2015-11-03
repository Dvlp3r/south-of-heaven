class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
    tags = []
    @artists.each do |artist|
      tags << artist.instagramtag
    end
    gon.instagramtags = tags
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find(params[:id])
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
    if @artist.instagramtag[0] == '#'
     @artist.instagramtag = @artist.instagramtag.tr('#', '')
    end

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

  def show_feed
    respond_to do |format|               
      format.js
    end
  end   

  # def connect
  #   @artist = Artist.find(params[:id])

  #   Instagram.configure do |config|
  #     config.client_id = "614bd5033e9c4492a5da0a515e505b99"
  #     config.client_secret = "3c6f57829870483599f1fa5772ef2a2a"
  #   end

  #   redirect_to Instagram.authorize_url(:redirect_uri => oauth_callback_path(:id => @artist.id))
  # end

  # def instagram_session
  #   @artist = Artist.find(params[:id])
  #   @artist.set_artist_instagram_session
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :instagramtag, :pic, :bio)
    end
end
