class ParticipantsController < ApplicationController
	before_action :set_event, only: [:create, :destroy]

	def create
		@participant = Participant.new(participant_params)

		if @participant.save
			flash[:notice] = "You have been registered to this event!"
			redirect_to event_url(@event)
		else
			flash[:notice] = "You can't register to this event."
			redirect_to event_url(@event)
		end
	end

	def destroy
		@participant = @event.participants.find(params[:id])
		@participant.destroy
		flash[:notice] = "You have no longer participate to this event."
		redirect_to event_url(@event), status: 303
	end

	private
		def set_event
			@event = Event.find(params[:event_id])
		end

		def participant_params
			params.require(:participant).permit(:user_id, :event_id, :status)
		end
end