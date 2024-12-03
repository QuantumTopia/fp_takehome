class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    # debugger
    @event_id = params[:event_id]
  end

  def create
    @booking = Booking.new(params.expect(booking: [:number_of_tickets, :event_id]))
    @booking.user = current_user
    @booking.event = Event.find(params[:booking][:event_id])
    enough_tickets = true

    if enough_tickets_remaining(@booking)
      @booking.event.tickets_remaining = @booking.event.tickets_remaining - @booking.number_of_tickets
    else
      enough_tickets = false
    end

    if enough_tickets and @booking.event.save and @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def booked_events
    @booked_events = Booking.select("title, sum(number_of_tickets) as total_number_of_tickets").joins(:event).group(:event_id).where(user_id: current_user.id)
  end

private
  def enough_tickets_remaining(booking)
    # debugger
    booking.event.tickets_remaining >= booking.number_of_tickets
  end
end
