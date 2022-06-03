class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all.order(id: 'desc')
  end

  def show
    @event = Event.find(params[:id])
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
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(events_params)
      flash[:notice] = "Event has been updated."
      redirect_to event_url(@event)
    else
      flash[:notice] = "Event can't be updated."
      redirect_to event_url(@event)
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = 'Event has been deleted.'
    redirect_to root_path
  end

  private
    def events_params
      params.require(:event).permit(:event_name, :date, :location, :body, :user_id)
    end
end
