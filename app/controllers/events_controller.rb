class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy]
  before_action :logged_in?

  def index
    @events = Event.all
    @event = Event.new
  end

  def show
    @package = Package.new
    @ticket = Ticket.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully added.' }
        format.json { render :index, status: :created, location: @event }
      else
        format.html { render :index }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

def edit
  @event = Event.find(params[:id])
end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to @event
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_url
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Event was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :display_photo)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
