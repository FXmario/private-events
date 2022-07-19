require 'rails_helper'

RSpec.describe Event, type: :model do
  
  user = User.new(id: 1, email: "user@example.com", password: "password", password_confirmation: "password")
  invalid_user = User.new(email: "user@example.com", password: "password", password_confirmation: "password")

  subject {
    Event.new(event_name: "Example", 
              date: Date.current, 
              location: "example",
              body: "aaaaaaaaaa",
              status: "Public",
              creator: user
             )
  }

  describe "#validation" do 
    context "valid attributes" do 
      it "is valid with valid attributes" do 
        expect(subject).to be_valid
      end
    end

    context "invalid attributes" do 
     it "should not valid without an event name" do
       subject.event_name = nil
       expect(subject).not_to be_valid
      end

      it "should not valid without a date" do
        subject.date = nil
        expect(subject).not_to be_valid
      end

      it "should not valid without a location" do 
        subject.location = nil
        expect(subject).not_to be_valid
      end

      it "should not valid without a body" do
        subject.body = nil
        expect(subject).not_to be_valid
      end

      it "should not valid without creator" do
        subject.creator = nil
        expect(subject).not_to be_valid
      end

      it "should not valid with invalid user" do 
        subject.creator = invalid_user
        expect(subject).not_to be_valid
      end

      it "should not valid without status" do
        subject.status = nil
        expect(subject).not_to be_valid
      end

      it "should not valid if status is not private or public" do
        subject.status = "invalid"
        expect(subject).not_to be_valid
      end
    end
  end

  describe "#after_save" do
    event = Event.new(event_name: "Example", 
                      date: Date.current, 
                      location: "Example location", 
                      body: "abcdefghijklmn",
                      status: "Private",
                      creator: user)
    event.save
    
    participant = Participant.create(user_id: event.creator.id, 
                                     event_id: event.id)

    it "should create participant after creator saving new event" do 
      expect(participant).to be_valid
    end
  end
end
