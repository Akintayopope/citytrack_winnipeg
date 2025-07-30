class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.order(event_date: :asc)
                   .page(params[:page])
                   .per(6) # Display 6 events per page
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully deleted.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:ward_id, :name, :location, :event_date, :description)
  end
end
