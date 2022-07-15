require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do

    before {@user = User.create(
      email: "user@example.com", 
      password: "password", 
      password_confirmation: "password"
      )}

    before {@event = Event.create!(
      event_name: 'Some name', 
      date: Date.today, 
      location: "Universe", 
      body: "Description of the event", 
      creator: @user,
      status: "public"
    )}

    describe "Index Page" do 
      it "should get index" do
        get events_path
        expect(response).to have_http_status(200)
      end
    end 

    it "should get show" do
      get event_path(@event)
      expect(response).to have_http_status(200)
    end

    it "should get new" do
      get new_event_path(@user)
      expect(response).to have_http_status(200)
    end
  end
end
