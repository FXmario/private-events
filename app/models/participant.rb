class Participant < ApplicationRecord
  scope :recent, -> { order(id: 'desc') }

  belongs_to :user
  belongs_to :event

  validates :user_id, presence: true 
  validates :event_id, presence: true 
end
