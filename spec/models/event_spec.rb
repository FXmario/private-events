require 'rails_helper'

RSpec.describe Event, type: :model do
  context "showing past and upcoming events with scopes" do 
    event_past = Event.create(event_name: "Some Name", date: Date.current - 1.days, location: "Jakarta", body: "Description of the event", user_id: 1)
    event_upcoming = Event.create(event_name: "Some Name", date: Date.current + 1.days, location: "Jakarta", body: "Description of the event", user_id: 1)
    
    it "should showing the past events" do
      expect(event_past.date).to be < Date.today
      expect(event_past.date).not_to be > Date.today
    end

    it "should showing upcoming events" do
      expect(event_upcoming.date).to be >= Date.today
      expect(event_upcoming.date).not_to be <= Date.today
    end
  end

  context "every columns can't be empty" do 
    event = Event.create(event_name: "Some Name", date: Date.today, location: "Jakarta", body: "Description of the event", user_id: 1)
    it "every events must has a name" do 
      expect(event.event_name).to be_truthy
      expect(event.event_name).not_to be_nil
    end

    it "every event must has a date" do
      expect(event.date).to be_truthy
      expect(event.date).not_to be_nil
    end

    it "every event must has a location" do 
      expect(event.location).to be_truthy
      expect(event.location).not_to be_nil
    end

    it "every event must has a description" do 
      expect(event.body).to be_truthy
      expect(event.body).not_to be_nil
    end
  end 
end
