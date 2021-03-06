class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :participants
  has_many :events
  has_many :attended_events, through: :participants, source: :event
  has_many :created_events, foreign_key: :user_id, class_name: "Event"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
