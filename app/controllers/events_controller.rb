class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:upcoming_events, :past_events, :show]
  before_action :set_events, except: [:upcoming_events, :past_events, :new, :create]
  before_action :set_users, only: [:upcoming_events, :past_events, :show]
  before_action :set_participants, only: [:upcoming_events, :past_events, :show]

  def upcoming_events
    @upcoming = Event.upcoming.recent
    @couting_upcoming = @upcoming.count
  end

  def past_events
    @past = Event.past.recent
    @couting_past = @past.count
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
