class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_events, except: [:index, :new, :create]

  def index
    @events_past = Event.past.order(id: 'desc')
    @events_upcoming = Event.upcoming.order(id: 'desc')
  end

  def show
    @participants = Participant.where(event_id: params[:id]).order(id: 'desc')
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      flash[:notice] = "Event has been saved."
      redirect_to event_url(@event)
    else
      flash[:notice] = "Event can't be saved."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(events_params)
      flash[:notice] = "Event has been updated."
      redirect_to event_url(@event)
    else
      flash[:notice] = "Event can't be updated."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = 'Event has been deleted.'
    redirect_to root_path, status: 303
  end

  private
    def set_events
      @event = Event.find(params[:id])
    end

    def events_params
      params.require(:event).permit(:event_name, :date, :location, :body, :user_id, :status)
    end
end
