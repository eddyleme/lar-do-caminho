class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @album = Album.find(params[:album_id])
    @photo = Photo.new
    @photo.album = @album
  end

  def create
    @album = Album.find(params[:album_id])
    photo_params[:file].each do |photo_file|
      @photo = Photo.create(file: photo_file, album: @album)
    end
    redirect_to root_path
  end

  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
  @photo.destroy
  respond_to do |format|
    format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    params.require(:photo).permit(file: [])
  end
end
