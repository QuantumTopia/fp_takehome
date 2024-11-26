class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.all
  end

  def my_events
    @events = Event.where(user_id: current_user.id)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

private
  def event_params
    params.expect(event: [:title, :description, :location, :date_time, :tickets_available])
  end
end
