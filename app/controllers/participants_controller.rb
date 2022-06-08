class ParticipantsController < ApplicationController
	# def new
	# 	@participant = Participant.new	
	# end

	def create
		@event = Event.find(params[:id])
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
		@event = Event.find(params[:event_id])
		@participant = Participant.find(params[:id])
		@participant.destroy
		flash[:notice] = "You have no longer participate to this event."
		redirect_to event_url(@event)
	end

	private
		def participant_params
			params.require(:participant).permit(:user_id, :event_id, :status)
		end
end
