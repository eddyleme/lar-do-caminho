class PackagesController < ApplicationController
  before_action :set_event, only: [:create]
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
  end

  def create
    @package = @event.packages.build(package_params)
    respond_to do |format|
      if @package.save!
        format.html { redirect_to event_path(params[:event_id]), notice: 'Package was successfully added.' }
        format.json { render :show, status: :created, location: @package }
      # else
      #   format.html { render :new }
      #   format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    event = Event.find(@package.event_id)
    @package.destroy
    respond_to do |format|
      format.html { redirect_to event_path(event), notice: 'Package was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def package_params
    params.require(:package).permit(:name, :description, :price)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_package
    @package = Package.find(params[:id])
  end

end
