class ParticipantsController < ApplicationController
	before_action :set_event, only: [:create, :destroy]

	def create
		@participant = Participant.new(participant_params)
	
		if @participant.save
			redirect_to event_url(@event), notice: "Successed join to this event"
		else
			redirect_to event_url(@event), alert: "This user can't join to this event."
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
			params.require(:participant).permit(:user_id, :event_id)
		end
end
