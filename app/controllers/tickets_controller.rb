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

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    begin
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @package.price,
        :description => @package.name,
        :currency    => 'usd'
      )
      respond_to do |format|
        if @ticket.save!
          format.html { redirect_to event_path(@event.id), notice: 'Ticket was successfully booked' }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { render :new }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    rescue Stripe::CardError => e
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end


  # josh paypal cart code
  # def create
  #   @package = Package.find(params[:package_id])
  #   @ticket = Ticket.create!(:cart => current_cart, :package => @package, :quantity => 1, :unit_price => @package.price)
  #   flash[:notice] = "Added #{@package.name} to cart."
  #   redirect_to current_cart_url
  # end

  private

  def ticket_params
    x = params.require(:ticket).permit(:package_id)
    {
      package_id: x[:package_id],
      name: params[:stripeBillingName],
      email: params[:stripeEmail],
      token_id: params[:stripeToken],
      amount_paid: @package.price
    }
  end

  def set_package
    @package = Package.find(params[:package_id])
  end

  def set_event
    @event = Event.find(@package.event_id)
  end

end
