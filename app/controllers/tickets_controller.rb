class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @tickets = Ticket.new
  end

  def update
  end

  def create
    @package = Package.find(params[:package_id])
    @ticket = Ticket.create!(:cart => current_cart, :package => @package, :quantity => 1, :unit_price => @package.price)
    flash[:notice] = "Added #{@package.name} to cart."
    redirect_to current_cart_url
  end
end
