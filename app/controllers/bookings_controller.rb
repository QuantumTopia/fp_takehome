class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @event_id = params[:event_id]
  end

  def create
    @booking = Booking.new(params.expect(booking: [:number_of_tickets, :event_id]))
    @booking.user = current_user
    @booking.event = Event.find(params[:booking][:event_id])

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def booked_events
    @booked_events = Booking.select("title, sum(number_of_tickets) as total_number_of_tickets").joins(:event).group(:event_id).where(user_id: current_user.id)
  end
end
