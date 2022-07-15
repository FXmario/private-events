class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_events, except: [:index, :new, :create]
  before_action :set_users, only: [:index, :show]
  before_action :set_participants, only: [:index, :show]

  def index
    @events_past = Event.past.recent
    @events_upcoming = Event.upcoming.recent
    @counting_events = Event.count
  end

  def show
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
      render :new, status: :unprocessable_entity, alert: "Event can't be saved."
    end
  end

  def edit
  end

  def update
    if @event.update(events_params)
      flash[:notice] = "Event has been updated."
      redirect_to event_url(@event)
    else
      render :new, status: :unprocessable_entity, alert: "Event can't be updated."
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

    def set_users
      @users = User.all
    end

    def set_participants
      @participants = Participant.where(event_id: params[:id]).recent
    end
end
