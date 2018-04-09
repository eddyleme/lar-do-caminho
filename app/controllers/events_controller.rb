class EventsController < ApplicationController
  def index
<<<<<<< HEAD
    @events = Event.all
  end

  def show
    @event = Event.find(params:[:id])
=======
    @events = Event.find(:all)
  end

  def show
    @event = Event.find(params[:id])
>>>>>>> photo_upload
  end

  def new
    @event = Event.new
<<<<<<< HEAD
=======
  end

  def create
    @event = Event.new(params[:category])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to @event
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
>>>>>>> photo_upload
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


end
