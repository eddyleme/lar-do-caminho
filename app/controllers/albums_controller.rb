class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  def index
    @albums = Album.all
    @album = Album.new
  end

  def show
  end

  def new
    @album = Album.new
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Photo album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Photo album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo_album.destroy
    respond_to do |format|
      format.html { redirect_to photo_albums_url, notice: 'Photo album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_album
      @photo_album = PhotoAlbum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_album_params
      params.require(:photo_album).permit(:title, :description, :cover_image)
    end
end
