class Event < ApplicationRecord
  scope :past, -> { where("date < ? ", Date.today) }
  scope :upcoming, -> { where("date >= ? ", Date.today) }
  scope :recent, -> { order(id: 'desc') }

  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :participants, dependent: :destroy
  has_many :attendeer, through: :participants, source: :user

  has_rich_text :body

  validates :event_name, presence: true, length: { minimum: 6 }
  validates :date, presence: true
  validates :location, presence: true 
  validates :body, presence: true, length: { minimum: 10 } 
  validates :user_id, presence: true

  after_save :auto_join

   def auto_join
     event = Event.find(self.id)
     Participant.create(user_id: event.creator.id, event_id: event.id)
   end

   VALID_STATUSES = ['Private', 'Public']

   validates :status, inclusion: { in: VALID_STATUSES }, presence: true

   def privated?
     status == 'Private'
   end
end
