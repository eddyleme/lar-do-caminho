class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  before_action :logged_in?

  def index
    @events = Event.all
  end

  def show
    @package = Package.new
  end

  def new
    @event = Event.new
  end

  def update
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
