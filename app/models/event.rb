class Event < ApplicationRecord
  scope :past, -> { where("date < ? ", Date.today) }
  scope :upcoming, -> { where("date >= ? ", Date.today) }
  scope :recent, -> { order(id: 'desc') }
  scope :counts, -> { where(status: 'public').count }

  belongs_to :creator, class_name: "User", foreign_key: :user_id
  has_many :participants, dependent: :destroy
  has_many :attendeer, through: :participants, source: :user

  has_rich_text :body

  validates :event_name, presence: true
  validates :date, presence: true
  validates :location, presence: true 
  validates :body, presence: true 
  validates :user_id, presence: true

  VALID_STATUSES = ['private', 'public']

  validates :status, inclusion: { in: VALID_STATUSES }

  def privated?
    status == 'private'
  end
end
