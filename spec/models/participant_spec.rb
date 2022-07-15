require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe "#validation" do
    user = User.create(id: 1,
                       email: "user@example.com", 
                       password: "password", 
                       password_confirmation: "password")

    event = Event.new(id: 1,
                      event_name: "Example", 
                      date: Date.current, 
                      location: "example",
                      body: "aaaaaaaaaa",
                      status: "public",
                      creator: user)

    subject{
      Participant.create(user_id: event.creator.id,
                         event_id: event.id)
    } 
    
    context "valid attributes" do 
      it "should valid with valid attributes" do 
        expect(subject).to be_valid
      end
    end

    context "creator" do 
      it "should not valid without creator" do
        subject.user_id = nil
        expect(subject).not_to be_valid
      end
      
      it "should not valid except creator.id" do
        subject.user_id = event.creator.email
        expect(subject).not_to be_valid
      end
    end

    context "event" do
      it "should not valid without event_id" do 
        subject.event_id = nil
        expect(subject).not_to be_valid
      end

      it "should not valid except event.id" do 
        subject.event_id = event.status
        expect(subject).not_to be_valid
      end
    end
  end 
end
