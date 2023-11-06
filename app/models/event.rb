class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :attended_events
  has_many :attendees, through: :attended_events

  scope :past, -> { where(date: ..(Time.now.midnight)) }
  scope :future, -> { where(date: (Time.now.midnight - 1.day)..) }

  def past?
    Date.parse(date).past?
  end

  def future?
    Date.parse(date).future?
  end
end
