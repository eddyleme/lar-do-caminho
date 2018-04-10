class TicketsController < ApplicationController
  before_action :set_package, only: [:create]
  before_action :set_event, only: [:create]

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @tickets = Ticket.new
  end

  def create
    @ticket = @package.tickets.build(ticket_params)
    respond_to do |format|
      if @ticket.save!
        format.html { redirect_to event_path(@event.id), notice: 'Ticket was successfully booked' }
        format.json { render :show, status: :created, location: @ticket }
      # else
      #   format.html { render :new }
      #   format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :email)
  end

  def set_package
    @package = Package.find(params[:package_id])
  end

  def set_event
    @event = Event.find(@package.event_id)
  end

end
