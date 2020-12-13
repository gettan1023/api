class Room < ApplicationRecord
  belongs_to :jugyo
  has_many :user_room_messages
  has_many :users, through: :user_rooms

  before_create :set_uuid

  scope :not_closed, -> { joins(:jugyo).merge(Jugyo.not_closed) }

  private
    def set_uuid
      self.uuid = SecureRandom.uuid
    end
end
