class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event
    @attendees = @event.attendees
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :date, :location, :description)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
