class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants
  has_rich_text :body
end
